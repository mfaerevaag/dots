# .dotfile
# system/path.zsh

# MAN
export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"

# PATH

# Mac OS X
if [ $(uname -a | grep -c "Darwin") -gt 0 ]
then
    export CABAL_PATH=/Users/markus/.cabal/bin

# Linux
else
    export NODE_PATH=/usr/lib/node_modules
    export CABAL_PATH=/home/$USER/.cabal/bin
    export RUBY_PATH=`ruby -rubygems -e "puts Gem.user_dir"`/bin
    export RVM_PATH=$HOME/.rvm/bin
fi

export PATH=$HOME/bin:/usr/local/bin:$CABAL_PATH:$NODE_PATH:$RUBY_PATH:$RVM_PATH:$PATH
