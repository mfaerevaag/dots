#!/bin/sh

# signal window manager to update volume bar
signal() {
    pkill -RTMIN+1 i3blocks
}

# change after your setup
CARD='0'
CHANNELS="Master Front Surround Center LFE"

# get "muted" or "unmuted"
get_state() {
    res="unmuted"

    for m in $CHANNELS; do
        if amixer -c $CARD get $m | grep '\[off\]' > /dev/null; then
            res="muted"
            break;
        fi
    done

    echo $res
}

# run for all playable channels
for_all_channels() {
    for channel in $CHANNELS; do
        amixer -c $CARD set $channel $1 > /dev/null
    done
}

# parse arg and run
if [[ $1 == "+" ]]
then
    amixer -c $CARD -q sset Master $2+
    signal
elif [[ $1 == "-" ]]
then
    amixer -c $CARD -q sset Master $2-
    signal

elif [[ $1 == "mute" ]]
then
    amixer -c $CARD set Master mute > /dev/null
    signal

elif [[ $1 == "unmute" ]]
then
    for_all_channels "unmute"
    signal

elif [[ $1 == "toggle" ]]
then
    state=`get_state`
    if [ "$state" == "muted" ]; then
        for_all_channels "unmute"
    else
        amixer -c $CARD set Master mute > /dev/null
    fi
    signal

elif [[ $1 == "show" ]]
then
    amixer -c $CARD get Master
    signal

else
    echo "usage: $0 <show | toggle | mute | unmute | +/- [0-9]+>"
fi
