# zplug
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

# alias
alias rm="rm -i"
alias ll="ls --color=auto -l"
alias la="ls --color=auto -la"
alias sd="sudo systemctl"
alias sdu="systemctl --user"
alias p="sudo pacman"
alias y="yaourt --noconfirm"
alias dots="git --git-dir=$HOME/.dots/ --work-tree=$HOME"

# bindings
bindkey -e
bindkey -s '\el' 'll\n'
bindkey -s '\ek' 'git status\n'

# zsh
setopt histignoredups

# theme
# always use a theme except when TRAMP (Emacs) is used.
if [[ $TERM == "dumb" ]]; then
    PS1='$ '
fi
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme, \
      if:"[[ $TERM != 'dumb' ]]"
zplug "mafredri/zsh-async", from:github, on:"sindresorhus/pure"

# plugins
zplug "zsh-users/zsh-completions", from:github

zplug "plugins/colored-man-pages", from:oh-my-zsh

# zplug "plugins/ssh-agent", from:oh-my-zsh

zplug "plugins/git", from:oh-my-zsh

zplug "zsh-users/zsh-syntax-highlighting", from:github, \
      if:"[[ $TERM != 'dumb' ]]"

zplug "zsh-users/zsh-autosuggestions", from:github, \
      if:"[[ $TERM != 'dumb' ]]"

# notify when a long running command exit
zplug "marzocchi/zsh-notify", from:github

zplug 'mfaerevaag/wd', as:command, use:"wd.sh", hook-load:"wd() { . $ZPLUG_REPOS/mfaerevaag/wd/wd.sh }"

# install and load
if ! zplug check --verbose 2>&-; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load #--verbose
