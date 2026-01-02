# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                              FISH CONFIG                                  ║
# ║                       ~/.config/fish/config.fish                          ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# path
fish_add_path -m ~/.cargo/bin

# env
set -x XDG_CURRENT_DESKTOP sway
set -x XDG_SESSION_DESKTOP sway
set -x XDG_SESSION_TYPE wayland
set -x GTK_THEME Adwaita:dark
