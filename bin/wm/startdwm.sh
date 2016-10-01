#!/bin/env sh

while true; do
    # Set root title
    sh ~/.xsetroot

    # # Check battery level
    # BATT=$( acpi -b | sed 's/.*[charging|unknown], \([0-9]*\)%.*/\1/gi' )
    # STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi' )
    # if ([ $BATT -le 5 ] && [ $STATUS == 'Discharging' ]); then
    #     # Beep
    #     echo -e "\007" >/dev/tty10 && sleep 0.2
    #     echo -e "\007" >/dev/tty10 && sleep 0.2
    #     echo -e "\007" >/dev/tty10 && sleep 0.2
    #     # Blink
    #     echo 'on' > /proc/acpi/ibm/light && sleep 1
    #     echo 'off' > /proc/acpi/ibm/light
    # fi

    sleep 5s
done &


while true; do
    # Log stderror to a file
    dwm 2> ~/.config/dwm/dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
