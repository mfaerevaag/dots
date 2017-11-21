#!/usr/bin/sh

REPO="git@github.com:mfaerevaag/dots.git"
DIR="$HOME/.dots"
BACKUP="$HOME/.dots-backup"

function dots
{
   /usr/bin/git --git-dir=$DIR --work-tree=$HOME $@
}

git clone --bare $REPO $DIR

# check if existing
if dots checkout; then
    echo "checked out dots"
else
    echo "backing up pre-existing dot files"
    mkdir -p $BACKUP
    dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} $BACKUP/{}
fi;

# ignore untracked files
dots config status.showUntrackedFiles no
