# .dotfile
# fish config

# variables
set -U FISH (dirname (status -f))
set -x EDITOR "emc"
set -x BROWSER "firefox"
set -x DESKTOP_SESSION "i3"

set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"

set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

set -x GTK2_RC_FILES "/usr/share/themes/Adwaita-dark-gtk2/gtk-2.0/gtkrc" # gtk-2.0
set -x GTK_THEME "Adwaita:dark" # gtk-3.0
set -x QT_STYLE_OVERRIDE "Adwaita-Dark" # qt5

set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")

# theme
source $FISH/themes/bobthefish/fish_prompt.fish

# greeting
source $FISH/greeting.fish

# aliases
source $FISH/aliases.fish

# bindings
source $FISH/bindings.fish

# path
# set PATH $HOME/bin $HOME/.local/bin /usr/local/bin /usr/local/sbin /usr/bin /usr/bin/site_perl /usr/bin/vendor_perl /usr/bin/core_perl
# set -gx PATH $HOME/bin $HOME/.local/bin $PATH
set -U fish_user_paths ~/bin ~/.local/bin
