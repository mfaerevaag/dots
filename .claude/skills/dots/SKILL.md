---
name: dots
description: AI wrapper for dotfiles management via bare git repo at ~/.dots
allowed-tools: Bash, Read, Glob
user-invocable: true
arguments: "[action] [path or args]"
---

Manage dotfiles without dealing with git commands directly.

## Setup

The `dots` alias is a fish function wrapping:
```
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME
```

Branches:
- `main` — global configs (fish, nvim, tmux, claude) for Codespaces
- Machine-specific branches (e.g., `kimchi`) — include desktop configs (sway, waybar, alacritty)

## Actions

### status (default)
Show what's changed in dotfiles.
```bash
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME status
```
Summarize: current branch, modified files, untracked files worth adding.

### add <path>
Add file or directory to dotfiles.
1. Check if path exists
2. For fish configs: exclude fisher-managed files (check against `fish_plugins`)
3. Stage: `/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME add <path>`
4. Show what was staged
5. Ask user for commit message or generate one

### commit [message]
Commit staged changes.
```bash
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME commit -m "message"
```

### sync
Pull and push current branch.
```bash
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME pull --rebase origin <branch>
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME push origin <branch>
```
Report conflicts if any; don't auto-resolve.

### diff [branch]
Show differences. No arg = working tree vs HEAD. With branch = current vs that branch.
```bash
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME diff [branch]
```

### log
Show recent commits.
```bash
/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME log --oneline -10
```

## Fisher-Managed Files (exclude from add)

Read `~/.config/fish/fish_plugins` and exclude files installed by those plugins:
- `completions/` files matching plugin names
- `functions/` files from plugins (fisher.fish, nvm.fish, wd.fish, __bobthefish_*, etc.)
- `conf.d/` files from plugins (nvm.fish, fish-ssh-agent.fish, fish_frozen_*)

## Blocked Files (never add)

- `.credentials.json`
- `.env*`
- `*token*`, `*secret*`, `*key*.json`
- `fish_variables` (runtime state)

Warn user and skip these.

## Rules

- Always show the git command being run
- Confirm before committing
- Report current branch in status
- For ambiguous requests, ask which branch to target
