# .dotfile
# emacs/emacs.zsh

# https://github.com/dreki/dotfiles/blob/master/.zshrc
# make things work inside Emacs.
if [[ -n ${INSIDE_EMACS} ]]; then
    # This shell runs inside an Emacs *shell*/*term* buffer.
    # prompt walters
    unsetopt zle
fi

# alias
alias e="emacs -nw"
