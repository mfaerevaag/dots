# .dotfile
# fish - wd wrapper function

function wd -d 'warp directory'
  if set output (_wd $argv)
    cd $output
  else
    for line in $output
      echo $line
    end
  end
end
