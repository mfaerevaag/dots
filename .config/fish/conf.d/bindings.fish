bind alt-backspace backward-kill-word
bind ctrl-backspace backward-kill-token

function _bind_git_status -d "git status"
    echo 'git status'
    git status
    commandline -f repaint
end

function _bind_ls -d "ls current dir"
    echo ''
    ls -lah
    commandline -f repaint
end

function fish_user_key_bindings
    bind \ek _bind_git_status
    bind \el _bind_ls
end
