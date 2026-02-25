#!/bin/bash
set -euo pipefail

# Dotfiles bare repo installer for GitHub Codespaces
# This script is run from ~/dotfiles after GitHub clones the repo

DOTS_DIR="$HOME/.dots"
BACKUP_DIR="$HOME/.dots-backup"

# Get the branch this script lives on (or default to main)
BRANCH="${DOTFILES_BRANCH:-main}"

# Setup bare repo
git clone --bare "https://github.com/mfaerevaag/dots.git" "$DOTS_DIR" 2>/dev/null || true

dots() {
  git --git-dir="$DOTS_DIR" --work-tree="$HOME" "$@"
}

# Configure to not show untracked files
dots config status.showUntrackedFiles no

# Backup existing files that would conflict
mkdir -p "$BACKUP_DIR"
dots checkout "$BRANCH" 2>&1 | grep -E "^\s+" | awk '{print $1}' | while read -r file; do
  if [[ -f "$HOME/$file" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "$file")"
    mv "$HOME/$file" "$BACKUP_DIR/$file"
  fi
done

# Checkout dotfiles
dots checkout "$BRANCH" || {
  echo "Checkout failed. Conflicting files backed up to $BACKUP_DIR"
  exit 1
}

echo "Dotfiles installed from branch: $BRANCH"
