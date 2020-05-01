function rm
    command rm -i $argv
end

function sd
    sudo systemctl $argv
end

function sdu
    systemctl --user $argv
end

function p
    sudo pacman $argv
end

function y
    yay $argv
end

function cb
    xclip -selection c
end

function dots
    git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end
