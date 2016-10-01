# .dotfile
# functions/trash.zsh

trash()
{
    if [[ $1 == "--clean" ]]
    then
        if yesorno "Clean out trash" n
        then
            rm -rf ~/.Trash/*
            rm -rf ~/.Trash/.*
        fi
    else
        for arg in $@
        do
            mv $arg ~/.Trash/
        done
    fi
}
