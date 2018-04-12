# .dotfile
# fish - wifi connect function

function wicon
    wires
    sudo netctl start $argv
end

complete -c wicon -xa "(netctl list | sed 's/[ *]//g')"
