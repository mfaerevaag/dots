#!/bin/sh

# login
lpass status
if [[ $? -ne 0 ]]; then
    lpass login m@frv.ag || exit
fi

# get alternatives
passwords=$(lpass ls | grep -v '.*\/\s' | grep -v 'Generated' | awk '{print $1;}')

# get choice
choice=$(printf '%s\n' "${passwords}" | dmenu "$@")

# exit if no choice
[[ -n $choice ]] || exit

# get password
lpass show -c --password $choice
