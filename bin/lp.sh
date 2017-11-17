#!/bin/sh

# login
if not lpass status
then lpass login m@frv.ag
fi

# get alternatives
passwords=$(lpass ls | grep -v '.*\/\s' | grep -v 'Generated' | awk '{print $1;}')

# get choice
choice=$(printf '%s\n' "${passwords}" | dmenu "$@")

# exit if no choice
[[ -n $choice ]] || exit

# get password
lpass show -c --password $choice
