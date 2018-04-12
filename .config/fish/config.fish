# .dotfile
# fish config

# variables
set -U FISH (dirname (status -f))
set -x EDITOR "vim"

set -x LC_ALL "en_US.UTF-8"
set -x LANG "en_US.UTF-8"
set -x LANGUAGE "en_US.UTF-8"

set -x LESS_TERMCAP_md (printf "\e[01;31m")
set -x LESS_TERMCAP_me (printf "\e[0m")
set -x LESS_TERMCAP_se (printf "\e[0m")
set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
set -x LESS_TERMCAP_ue (printf "\e[0m")
set -x LESS_TERMCAP_us (printf "\e[01;32m")

# theme
source $FISH/themes/bobthefish/fish_prompt.fish

# aliases
source $FISH/aliases.fish

# bindings
source $FISH/bindings.fish

# path
set PATH $HOME/bin /usr/local/bin /usr/lib/node_modules $HOME/.cabal/bin $HOME/.cargo/bin $PATH
