# .dotfile
# fish - trash function

function trash -d "Move to trash"
  if [ $argv[1] = "--clean" ]
    if yesorno "Clean out trash?" 'n'
      rm -rf ~/.Trash/*
      rm -rf ~/.Trash/.*
    else
      return 1
    end
  else
    for arg in $argv
      mv $arg ~/.Trash/
    end
  end

  return 0
end
