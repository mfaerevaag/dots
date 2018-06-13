function rm
  command rm -i $argv
end

function dots
    command /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end
