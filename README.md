# gungnir

## Machine

- **Host:** Lenovo ThinkPad T14s Gen 3
- **CPU:** AMD Ryzen 7 PRO 6850U / Radeon 680M iGPU
- **RAM:** 32 GB
- **OS:** Arch Linux (rolling), kernel `6.18.13-arch1-1`
- **Disk:** 1 TB NVMe, LUKS2-encrypted root (`ext4`), 1 GB EFI, 8 GB swapfile
- **Boot:** GRUB with Secure Boot via `sbctl` (custom-enrolled keys)

## Shell & Terminal

- **Shell:** fish 4.5 + bobthefish prompt (Hack Nerd Font)
- **Terminal:** Alacritty
- **Plugins:** fish-ssh-agent, nvm, wd-fish, compression, dots (vendored locally, no Fisher runtime)
- **Aliases:** `p` = pacman, `y` = yay, `sd`/`sdu` = systemctl, `rm` = rm -i, `dots` = bare-repo git

## WM / DE

- **WM:** Sway (Wayland)
- **Bar:** Waybar
- **Launcher:** Rofi (wayland fork)
- **Notifications:** Mako
- **Lock:** swaylock
- **Screenshot:** Satty (+ grim/slurp)
- **Clipboard:** wl-clipboard
- **Theme:** Adwaita:dark, solid `#111111` background
- **Workspaces:** labeled with CJK numerals (一 二 三 …)

## Key Packages

**Dev tools:** neovim, git, github-cli, npm, tmux, claude-code, cursor-bin, figma-linux-bin, virtualbox

**System:** networkmanager, nftables, openssh, reflector, power-profiles-daemon, pipewire + wireplumber + pavucontrol

**Fonts:** Hack Nerd Font, DejaVu, Noto (+ CJK, emoji), Font Awesome

**AUR helper:** yay

## Dotfiles

- **Repo:** `git@github.com:mfaerevaag/dots.git` (bare clone at `~/.dots`)
- **Branch:** `gungnir` (machine-specific; other branches: `kimchi`, `archive`)
- **Usage:**
  - `dots s` — status
  - `dots a <file>` — stage
  - `dots cm '<msg>'` — commit
  - `dots push` — push
- Untracked files hidden by default (`status.showUntrackedFiles no`)

## Notes

- Secure Boot: keys manually enrolled with `sbctl create-keys` + `sbctl enroll-keys -m`, GRUB and kernel signed
- GRUB reinstalled with extended module set for LUKS2/TPM unlock
- Timezone: `Europe/Oslo`
- Figma desktop entry copied to `~/.local/share/applications/` (customized)
