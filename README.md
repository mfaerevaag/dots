dots
====

My simple dotfile setup with bare git repo, based of this [blog article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).


## Initial setup

```sh
git init --bare $HOME/.dots
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
dots config status.showUntrackedFiles no
```

## Example

```sh
dots status
dots add .exmplerc
dots commit -m "add example config"
dots push
```

## Aliases

For `zsh` or `bash`:
```zsh
alias dots='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
```

For `fish`:
```fish
function dots
    command /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $argv
end
```

## Migrating

```sh
git clone --separate-git-dir=$HOME/.dots /path/to/repo $HOME/dots-tmp
cp ~/dots-tmp/.gitmodules ~  # If you use Git submodules
rm -r ~/dots-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
```

Also see [`bin/dots-import.sh`](bin/dots-import.sh).
