#!/usr/bin/bash

if ! systemctl --user is-active window-manager.target &> /dev/null
then
    systemctl --user import-environment DISPLAY XAUTHORITY
    systemctl --user start window-manager.target
fi
