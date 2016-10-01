# .dotfile
# functions/mm.zsh
# simple script for settings up multi head

mm() {
    local orien=$1

    case "$orien" in
        dup|duplicate)
            xrandr --auto
            ;;
        single|re|reset)
            xrandr -s 0
            ;;

        right-of|right|r)
            orien="right-of"
            ;;

        left-of|left|l)
            orien="left-of"
            ;;

        above|a)
            orien="above"
            ;;

        below|b)
            orien="below"
            ;;

        t) # custom
            xrandr --output DisplayPort-0 --off \
            --output HDMI-0 --mode 1920x1200 --pos 0x0      --rotate normal \
            --output HDMI-1 --mode 1920x1200 --pos 1920x0   --rotate normal \
            --output eDP-0  --mode 1920x1080 --pos 928x1200 --rotate normal
            return
            ;;

        *)
            echo "error: unknown option '$orien'"
            return 1
            ;;
    esac

    local stock="eDP1"
    local last=$stock

    for screen in $(xrandr | grep -E '\sconnected' | awk '{ print $1 }')
    do
        if [[ $screen != "eDP1" ]]
        then
            xrandr --output $screen --auto --$orien $last
            last=$screen
        fi
    done
}
