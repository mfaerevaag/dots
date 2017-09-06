#!/bin/bash

usage="usage: $(basename "$0") [-h] ACCOUNT

Runs offlineimap for a single account then shows notification for any new messages (OS X only)

where:
    -h       show this help text
    ACCOUNT  the offlineimap account name"

: ${1?"Usage: $0 ACCOUNT"}

while getopts ':hs:' option; do
  case "$option" in
    h) echo "$usage"
       exit
       ;;
   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done

function clean {
    sed "s/^\[/\\\[/g" | sed "s/\"/'/g" | sed 's/\!/❕/g'
}

function extract_sender {
    grep -o '^From: \(.*\)$' $1 | sed "s/^From: //g" | clean
}
function extract_subject {
    grep -o '^Subject: \(.*\)$' $1 | sed "s/^Subject: //g" | perl -pe 'use MIME::Words(decode_mimewords); $_=decode_mimewords($_);' | clean
}

function offlineimap_notify {
    account=$1
    previousmessages=/tmp/offlineimap_${account}_messages
    newcount=0
    sender=''
    subject=''

    # run OfflineIMAP once, with quiet interface
    offlineimap -o -u quiet -a $account

    maildirnew="$HOME/mail/$account/INBOX/new"
    if [ ! -e "$previousmessages" ] ; then
        touch "$previousmessages"
    fi

    # check if the mails weren't already seen/reported before
    # and add them to a temporary list of previously seen/reported mails
    for file in $maildirnew/*
    do
        if [ ! -f $file ] ; then
            continue
        fi

        filename=$(basename "$file")
        if grep -Fxq "$filename" "$previousmessages" ; then
            : echo "seen"
        else
            echo "$filename" >> "$previousmessages"
            newcount=$((newcount+1))
            if [ -z "$sender" ] ; then
                sender="`extract_sender $file`"
            fi
            if [ -z "$subject" ] ; then
                subject=`extract_subject $file`
            fi
        fi
    done


    if [ $newcount -gt 1 ] ; then
        title="$newcount new messages for $account 📬 "
        subtitle=`echo -e "$sender and others"`
        body=`echo -e "$subject"`
    else
        title="New message for $account ✉️"
        subtitle=`echo -e "$sender"`
        body=`echo -e "$subject"`
    fi

    if [ $newcount -gt 0 ]
    then
        # osascript -e 'display notification "'"$body"'" with title "'"$title"'" subtitle "'"$subtitle"'"'
        terminal-notifier -title "${title}" -subtitle "${subtitle}" -message "$body" -sender 'org.gnu.Emacs'
    fi
}

offlineimap_notify $1
