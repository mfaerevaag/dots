# .dotfile
# system/aliases.zsh

alias rm='rm -i'

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias lr='tree'
alias lf='ls -lRat -d -1'

# Mac OS X
if [ `uname -a | grep -c "Darwin"` -gt 0 ]
then


# Linux
else
    alias sd='sudo systemctl'

    alias akb='asus-kbd-backlight'
    alias sakb='sudo asus-kbd-backlight'

    alias y='yaourt --noconfirm'
    alias p='sudo pacman'
fi
