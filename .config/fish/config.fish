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

# ssh-agent
# source $FISH/ssh_agent.fish

# PATH
# set PYTHONPATH /usr/lib/python3.3/site-packages # python

set PATH $HOME/bin /usr/local/bin /usr/lib/node_modules $HOME/.cabal/bin $HOME/.cargo/bin $PATH
# type ruby > /dev/null; and set PATH (ruby -rubygems -e "puts Gem.user_dir")/bin $PATH

# opam
# source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
source /home/markus/.opam/opam-init/variables.fish > /dev/null 2> /dev/null; or true
set -gx PATH "/Users/you/.opam/system/bin" $PATH;
set -gx OCAML_TOPLEVEL_PATH "/home/markus/.opam/system/lib/toplevel";
set -gx PERL5LIB "/home/markus/.opam/system/lib/perl5:$PERL5LIB";
set -gx MANPATH $MANPATH "/Users/you/.opam/system/man";
set -gx CAML_LD_LIBRARY_PATH "/home/markus/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs";

# python
# status --is-interactive; and source (pyenv init -|psub)
