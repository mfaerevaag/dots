#!/usr/bin/sh

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

# xorg
xset r rate 250 30

# env
export EDITOR="vim"
export BROWSER="firefox"
export DESKTOP_SESSION="i3"

# locale
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

# gui themes
export GTK2_RC_FILES="/usr/share/themes/Adwaita-dark-gtk2/gtk-2.0/gtkrc" # gtk-2.0
export GTK_THEME="Adwaita:dark" # gtk-3.0
export QT_STYLE_OVERRIDE="Adwaita-Dark" # qt5

# path
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# window manager
exec i3 -c ~/.config/i3/config
