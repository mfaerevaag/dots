# .dotfile
# fish - yesorno function

function yesorno -d "Prompt user yes or no question"
  # safety
  if [ (count $argv) -ne 2 ]
    echo "yesorno: Invalid number of arguments: "(count $argv)" (expected 2)"
    return 1
  end

  # variables
  set question $argv[1]
  set default $argv[2]
  set prompt "$question [Y/n] "
  set yes_RETVAL "0"
  set no_RETVAL "3"
  set RETVAL ""
  set answer ""

  # read-eval loop
  while true
    read -p 'echo $prompt' answer

    if [ -z $answer ]
      set answer $default
    end

    switch $answer
      case Y y YES yes Yes
        set RETVAL $yes_RETVAL
        break

      case N n NO no No
        set RETVAL $no_RETVAL
        break

      case '*'
        echo "Please provide a valid answer (y or n)"

    end
  end

  return $RETVAL
end
