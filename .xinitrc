#!/usr/bin/env sh
#
# .dotfile
# xorg/xinitrc.symlink

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# xresources
if [ -s ~/.Xresources ]; then
    xrdb -merge ~/.Xresources
fi


# xmodmap
if [ -s ~/.Xmodmap ]; then
     xmodmap ~/.Xmodmap
fi

# x programs
xbindkeys &
xss-lock slock &
#sh ~/.synaptics &
#xflux -l 55.43 -g 12.26 -k 3500 & # copenhagen
xflux -l 36.350412 -g 127.384548 -k 3500 & # daejeon
xset r rate 250 30

# asus
# sudo asus-kbd-backlight allowusers
# asus-kbd-backlight 1

# other services/daemons
#dropboxd &
nm-applet &
# SpiderOakONE &

# wallpaper
feh --bg-scale ~/pics/wallpaper/arch_kiss.png &
conky &

# window manager
#exec $1
#exec awesome
#~/bin/wm/startdwm.sh
#~/bin/wm/startxmonad.sh
exec i3 -c ~/.config/i3/config
