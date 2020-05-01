function _bind_git_status -d "git status"
    echo ''
    if git status > /dev/null ^ /dev/null
        git status
    else
        set_color red
        echo "not a git repo!"
        set_color normal
    end
    commandline -f repaint
end

function _bind_ag -d "ag current command"
    commandline -i " | ag "
end

function _bind_ps -d "find process"
    echo ''

    ps aux | head -n 1
    ps aux | ag -v ag | ag (commandline -t)

    commandline -f repaint
end

function _bind_ls -d "ls current dir"
    echo ''
    ll
    commandline -f repaint
end

function fish_user_key_bindings
    bind \el _bind_ls
    bind \eg _bind_ag
    bind \ek _bind_git_status
    bind \ep _bind_ps
end
