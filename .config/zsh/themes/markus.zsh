# .dotfile
# zsh/oh-my-zsh/markus.zsh-theme

# return status
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

# prompt
PROMPT='${ret_status}\
%{$fg_bold[green]%}%p\
%{$fg[cyan]%}%2~ \
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} \
%{$reset_color%}'
#RPROMPT='%{$fg_bold[grey]%}%*%{$reset_color%}'

# git
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
