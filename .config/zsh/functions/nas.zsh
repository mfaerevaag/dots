# .dotfile
# functions/nas.zsh

mountnas () {
    sudo mount -t cifs //192.168.1.3/media -o user=Markus,sec=ntlm /mnt/nas
}
