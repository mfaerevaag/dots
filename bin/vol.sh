#!/usr/bin/bash

signal() {
    pkill -RTMIN+1 i3blocks
}

if [[ $1 == "+" ]]
then
    amixer -q sset Master $2+
    signal
elif [[ $1 == "-" ]]
then
    amixer -q sset Master $2-
    signal
elif [[ $1 == "toggle" ]]
then
    amixer -D pulse set Master 1+ toggle
    signal
else
    echo "usage: $0 <toggle | +/- [0-9]+>"
fi
