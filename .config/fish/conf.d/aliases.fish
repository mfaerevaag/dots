function rm
  #command rm -i $argv
  command trash $argv
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
    command wl-copy
end

function dots
    command /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end

function tf
    command terraform $argv
end
