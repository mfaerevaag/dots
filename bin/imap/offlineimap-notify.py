#!/usr/bin/python2
# Copyright (C) 2013  Raymond Wagenmaker
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

"""Run OfflineIMAP after adding notification sending to its UIs.

When an account finishes syncing, messages copied to the local repository will
be reported using D-Bus (through pynotify) or a fallback notifier command.
"""

import cgi
from collections import defaultdict, OrderedDict
import ConfigParser
from datetime import datetime
import email.header
import email.parser
import email.utils
import functools
import inspect
import locale
import operator
import os
import shlex
import string
import subprocess
import sys
import textwrap

import offlineimap
try:
    import pynotify
except ImportError:
    pass

__author__ = 'Raymond Wagenmaker'
__copyright__ = 'Copyright 2013  ' + __author__
__version__ = '0.5.1'

CONFIG_SECTION = 'notifications'
CONFIG_DEFAULTS = OrderedDict((
    ('summary',        'New mail for {account} in {folder}'),
    ('body',           'From: {h[from]}\nSubject: {h[subject]}'),
    ('icon',           'mail-unread'),
    ('urgency',        'normal'),
    ('timeout',        '-1'),
    ('max',            '2'),
    ('digest-summary', 'New mail for {account} ({count})'),
    ('digest-body',    '{count} in {folder}'),
    ('notifier',       'notify-send -a {appname} -i {icon} -c {category}'
                       ' -u {urgency} -t {timeout} {summary} {body}'),
    ('failstr',        '')
))

def send_notification(ui, conf, summary, body):
    appname = 'OfflineIMAP'
    category = 'email.arrived'
    encode = functools.partial(unicode.encode, errors='replace')
    try:
        pynotify.init(appname)
        notification = pynotify.Notification(encode(unicode(summary), 'utf-8'),
                                             encode(unicode(body), 'utf-8'),
                                             icon.encode('utf-8'))
        notification.set_category(category)
        notification.set_urgency(conf['urgency'])
        notification.set_timeout(conf['timeout'])
        notification.show()
    except (NameError, RuntimeError):  # no pynotify or no notification service
        try:
            format_args = {'appname': appname, 'category': category,
                           'summary': summary, 'body': body, 'icon': conf['icon'],
                           'urgency': conf['urgency'], 'timeout': conf['timeout']}
            encoding = locale.getpreferredencoding(False)
            subprocess.call([encode(word.decode(encoding).format(**format_args),
                                    encoding)
                             for word in shlex.split(conf['notifier'])])
        except ValueError as exc:
            ui.error(exc, msg='While parsing fallback notifier command')
        except OSError as exc:
            ui.error(exc, msg='While calling fallback notifier')

def add_notifications(ui_cls):
    def extension(method):
        old = getattr(ui_cls, method.__name__)
        uibase_spec = inspect.getargspec(getattr(offlineimap.ui.UIBase.UIBase,
                                                 method.__name__))

        @functools.wraps(old)
        def new(*args, **kwargs):
            old(*args, **kwargs)
            old_args = inspect.getcallargs(old, *args, **kwargs)
            method(**{arg: old_args[arg] for arg in uibase_spec.args})

        setattr(ui_cls, method.__name__, new)

    @extension
    def __init__(self, *args, **kwargs):
        self.local_repo_names = {}
        self.new_messages = defaultdict(lambda: defaultdict(list))

    @extension
    def acct(self, account):
        self.local_repo_names[account] = account.localrepos.getname()

    @extension
    def acctdone(self, account):
        if self.new_messages[account]:
            notify(self, account)
            self.new_messages[account].clear()

    @extension
    def copyingmessage(self, uid, num, num_to_copy, src, destfolder):
        repository = destfolder.getrepository()
        account = repository.getaccount()
        if (repository.getname() == self.local_repo_names[account] and
            'S' not in src.getmessageflags(uid)):
            self.new_messages[account][src].append(uid)

    return ui_cls

class MailNotificationFormatter(string.Formatter):
    _FAILED_DATE_CONVERSION = object()

    def __init__(self, escape=False, failstr=''):
        self.escape = escape
        self.failstr = failstr

    def convert_field(self, value, conversion):
        if conversion == 'd':
            datetuple = email.utils.parsedate_tz(value)
            if datetuple is None:
                return MailNotificationFormatter._FAILED_DATE_CONVERSION
            return datetime.fromtimestamp(email.utils.mktime_tz(datetuple))
        elif conversion in ('a', 'n', 'N'):
            name, address = email.utils.parseaddr(value)
            if not address:
                address = value
            if conversion == 'a':
                return address
            return name if name or conversion == 'n' else address
        return super(MailNotificationFormatter, self).convert_field(value,
                                                                    conversion)

    def format_field(self, value, format_spec):
        if value is MailNotificationFormatter._FAILED_DATE_CONVERSION:
            result = self.failstr
        else:
            result = super(MailNotificationFormatter, self).format_field(value,
                                                                         format_spec)
        return cgi.escape(result, quote=True) if self.escape else result

class HeaderDecoder(object):
    def __init__(self, message, failstr=''):
        self.message = message
        self.failstr = failstr

    def __getitem__(self, key):
        header = self.message[key]
        if header is None:
            return self.failstr
        return ' '.join(word.decode(charset, errors='replace')
                            if charset is not None else word
                        for word, charset in email.header.decode_header(header))

def get_config(ui):
    conf = CONFIG_DEFAULTS.copy()
    decode = operator.methodcaller('decode', locale.getpreferredencoding(False))
    try:
        for item in ui.config.items(CONFIG_SECTION):
            option, value = map(decode, item)
            if option in ('max', 'timeout'):
                try:
                    conf[option] = int(value)
                except ValueError:
                    ui.warn('value "{}" for "{}" is not a valid integer; '
                            'ignoring'.format(value, option))
            else:
                conf[option] = value
    except ConfigParser.NoSectionError:
        pass
    return conf

def notify(ui, account):
    encoding = locale.getpreferredencoding(False)
    account_name = account.getname().decode(encoding)
    conf = get_config(ui)
    notify_send = functools.partial(send_notification, ui, conf)
    summary_formatter = MailNotificationFormatter(escape=False, failstr=conf['failstr'])
    body_formatter = MailNotificationFormatter(escape=True, failstr=conf['failstr'])

    count = 0
    body = []
    for folder, uids in ui.new_messages[account].iteritems():
        count += len(uids)
        body.append(body_formatter.format(conf['digest-body'], count=len(uids),
                                          folder=folder.getname()))

    if count > conf['max']:
        summary = summary_formatter.format(conf['digest-summary'], count=count,
                                           account=account_name)
        return notify_send(summary, '\n'.join(body))

    need_body = '{body' in conf['body'] or '{body' in conf['summary']
    parser = email.parser.Parser()
    for folder, uids in ui.new_messages[account].iteritems():
        format_args = {'account': account_name,
                       'folder': folder.getname().decode(encoding)}
        for uid in uids:
            try:
                message = parser.parsestr(folder.getmessage(uid),
                                          headersonly=not need_body)
            except (AttributeError, KeyError, TypeError, ValueError) as exc:
                message = parser.parsestr("",
                                          headersonly=not need_body)
                ui.error(exc, msg='Error to get message')

            format_args['h'] = HeaderDecoder(message, failstr=conf['failstr'])
            if need_body:
                for part in message.walk():
                    if part.get_content_type() == 'text/plain':
                        charset = part.get_content_charset()
                        payload = part.get_payload(decode=True)
                        format_args['body'] = payload.decode(charset)
                        break
                else:
                    format_args['body'] = conf['failstr']
            try:
                notify_send(summary_formatter.vformat(conf['summary'], (), format_args),
                            body_formatter.vformat(conf['body'], (), format_args))
            except (AttributeError, KeyError, TypeError, ValueError) as exc:
                ui.error(exc, msg='In notification format specification')

def print_help():
    try:
        text_width = int(os.environ['COLUMNS'])
    except (KeyError, ValueError):
        text_width = 80
    tw = textwrap.TextWrapper(width=text_width)
    print('Notification wrapper v{} -- {}\n'.format(__version__, __copyright__))
    print(tw.fill(__doc__))
    print('\nDefault configuration:\n')
    default_config = offlineimap.CustomConfig.CustomConfigParser()
    default_config.add_section(CONFIG_SECTION)
    for option, value in CONFIG_DEFAULTS.iteritems():
        default_config.set(CONFIG_SECTION, option, value)
    default_config.write(sys.stdout)

def main():
    locale.setlocale(locale.LC_ALL, '')
    for name, cls in offlineimap.ui.UI_LIST.iteritems():
        offlineimap.ui.UI_LIST[name] = add_notifications(cls)
    try:
        offlineimap.OfflineImap().run()
    except SystemExit:
        if '-h' in sys.argv or '--help' in sys.argv:
            print('\n')
            print_help()
        raise

if __name__ == '__main__':
    main()
