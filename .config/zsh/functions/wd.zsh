# .dotfile
# functions/wd.zsh

# WD_PATH=$CODE/shell/wd

# fpath=($WD_PATH $fpath)

# wd() {
#     . $WD_PATH/wd.sh
# }

wd() {
    output=$(_wd $@)
    ret=$?

    if [[ $ret -eq 0  ]]
    then
        cd "$output"
    else
        if [[ "$output" != "" ]]
        then
            echo "$output"
        fi
    fi

    unset output
    unset ret
}
