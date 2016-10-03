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

# theme
source $FISH/themes/robby-russel.fish
#source $FISH/themes/bobthefish/fish_prompt.fish

# greeting
source $FISH/greeting.fish

# aliases
source $FISH/aliases.fish

# bindings
source $FISH/bindings.fish

# PATH
set PYTHONPATH /usr/lib/python3.3/site-packages # python

set PATH $HOME/bin /usr/local/bin /usr/lib/node_modules $HOME/.cabal/bin $PATH
type ruby > /dev/null; and set PATH (ruby -rubygems -e "puts Gem.user_dir")/bin $PATH
