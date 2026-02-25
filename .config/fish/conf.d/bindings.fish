bind alt-backspace backward-kill-word
bind ctrl-backspace backward-kill-token

function _bind_git_status -d "git status"
    echo 'git status'
    git status
    commandline -f repaint
end

function _bind_ls -d "ls current dir"
    echo 'ls -l'
    ls -l
    commandline -f repaint
end

function _bind_ls_hidden -d "ls current dir (hidden)"
    echo 'ls -la'
    ls -la
    commandline -f repaint
end

function _bind_git_log -d "git log HEAD"
    echo 'git log HEAD'
    git log --oneline -20 HEAD
    commandline -f repaint
end

function fish_user_key_bindings
    bind \el _bind_ls
    bind \eo _bind_ls_hidden
    bind \ek _bind_git_status
    bind \ei _bind_git_log
end
