# .dotfile
# functions/yesorno.zsh

yesorno()
{
    # safety
    if [ "$#" -ne 2 ]
    then
        echo -e "invalid number of arguments: $# (expected 2)" && return 1
    fi

    # variables
    local question="${1}"
    local default="${2}"
    local prompt="${question} ? [${default}] "
    local yes_RETVAL="0"
    local no_RETVAL="3"
    local RETVAL=""
    local answer=""

    # read-eval loop
    while true ; do
        printf $prompt
        read -r answer

        case ${answer:=${default}} in
            Y|y|YES|yes|Yes )
                RETVAL=${yes_RETVAL} && \
                    break
                ;;
            N|n|NO|no|No )
                RETVAL=${no_RETVAL} && \
                    break
                ;;
            * )
                echo "Please provide a valid answer (y or n)"
                ;;
        esac
    done

    return ${RETVAL}
}
