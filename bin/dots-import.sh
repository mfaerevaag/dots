#!/usr/bin/sh

function dots
{
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}

git clone --bare https://github.com/mfaerevaag/dots.git $HOME/.dots

mkdir -p .dots-backup

if dots checkout; then
    echo "checked out dots"
else
    echo "backing up pre-existing dot files"
    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

dots config status.showUntrackedFiles no
