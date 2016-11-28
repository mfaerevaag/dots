# .dotfile
# fish - mm function

function mm -d "Quickly setup multiple monitors"
  set opt $argv[1]
  set orien ''
  set stock 'eDP1'

  switch "$opt"
    case duplicate dup
      xrandr --auto
      return

    case reset re
      xrandr --output $stock --auto
      xrandr -s 0
      xrandr --dpi 96 # fix font size
      return

    case right-of right r
      set orien 'right-of'

    case left-of left l
      set orien 'left-of'

    case above a
      set orien 'above'

    case below b
      set orien 'below'

    # custom tee
    case t
      xrandr --output DisplayPort-0 --off \
      --output HDMI0 --mode 1920x1200 --pos 0x0      --rotate normal \
      --output HDMI1 --mode 1920x1200 --pos 1920x0   --rotate normal \
      --output eDP-0  --mode 1920x1080 --pos 928x1200 --rotate normal
      return

    # custom dual
    case d
      xrandr --output $stock --off \
      --output HDMI2 --mode 1920x1200 --pos 0x0    --rotate normal \
      --output HDMI1 --mode 1920x1200 --pos 1920x0 --rotate normal
      return

    # custom single
    case s
      xrandr --output $stock --off --output HDMI1 --auto
      return

    case '*'
      echo "Error: Unkown option '$opt'"
      return 1
  end

  set last $stock

  for screen in (xrandr | grep -E '\sconnected' | awk '{ print $1 }')
    if [ $screen = $stock ]; continue; end

    xrandr --output $screen --auto --$orien $last
    set last $screen
  end
end
