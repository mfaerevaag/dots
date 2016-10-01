# .dotfile
# functions/wifi.zsh

alias ips='sudo ip link set'

alias wicon='sudo netctl start'

wires () {
    sudo ip link set wlan0 down
    sudo netctl stop-all
}
