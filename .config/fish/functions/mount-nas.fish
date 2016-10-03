# .dotfile
# mount-nas

function mount-nas -d "mount home nas"
    sudo mount -t cifs //192.168.1.3/media -o user=markus,password=(pass misc/readynas-markus),sec=ntlm /mnt/nas
end
