# .dotfile
# fish - aliases

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
  yaourt --noconfirm $argv
end

function cb
    command xclip -selection c
end

function dots
    command /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end
