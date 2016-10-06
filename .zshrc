#!/bin/zsh

# .dotfile
# ~/.zshrc

export DOT=$HOME/.config/zsh
export CODE=$HOME/dev/code

# your project folder that we can `c [tab]` to
c() { cd $CODE/$1; }
compctl -W $CODE/ -/ c

# all of our zsh files
typeset -U config_files
config_files=($DOT/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh}
do
  source $file
done

unset config_files

# init oh-my-zsh
source $DOT/oh-my-zsh/init