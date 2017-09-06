#!/usr/bin/sh
#
# Script to notify user for new mails.
# Crontab ex:
# */3 * * * * ~/bin/offlineimap-notify.sh
#
# https://gist.github.com/nlamirault/38cfc46682eaeb28709e

#run OfflineIMAP once, with quiet interface
offlineimap -o -q -u quiet

maildir="$HOME/mail"

#count new mail for every maildir
maildirnew="$maildir/INBOX/new/"
new="$(find $maildirnew -type f | wc -l)"

#count old mail for every maildir
maildirold="$maildir/INBOX/cur/"
old="$(find $maildirold -type f | wc -l)"

if [ $new -gt 0 ]
then
    export DISPLAY=:0; export XAUTHORITY=~/.Xauthority;
    notify-send -a "OfflineIMAP" "New mail!\nNew: $new Old: $old" -i mail-unread
fi
