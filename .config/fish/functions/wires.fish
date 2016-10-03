# .dotfile
# fish - wifi disconnect function

function wires
    sudo ip link set wlan0 down
    sudo netctl stop-all
end
