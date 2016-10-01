# .dotfile
# system/env.zsh


# Mac OS X
if [ `uname -a | grep -c "Darwin"` -gt 0 ]
then
    # ssh
    export SSH_PRIVATE_KEY_PATH="~/.ssh/id_rsa"
    export SSH_PUBLIC_KEY_PATH="~/.ssh/id_rsa.pub"

# Linux
else
    export TERM=rxvt-unicode-256color

    export EDITOR="emc"
    export BROWSER="firefox"
    export DESKTOP_SESSION="i3"

    # locale
    export LC_ALL="en_US.UTF-8"
    export LANG="en_US.UTF-8"
    export LANGUAGE="en_US.UTF-8"

    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

    # compilation flags
    export ARCHFLAGS="-arch x86_64"
fi
