dots
====

My simple dotfile setup with bare git repo, based of [this blog article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/).

I keep a separate branch for each device.


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
curl -Ls https://gist.github.com/mfaerevaag/6f81eb5aab8412dc1e5d1698d6abfb04/raw/ | /bin/bash
```

See [`dots-import.sh`](https://gist.github.com/mfaerevaag/6f81eb5aab8412dc1e5d1698d6abfb04).
