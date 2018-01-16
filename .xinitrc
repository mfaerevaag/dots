#!/usr/bin/env sh
# .dotfile

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
xset r rate 250 30

# window manager
exec i3 -c ~/.config/i3/config
