# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                              FISH CONFIG                                  ║
# ║                       ~/.config/fish/config.fish                          ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# path
fish_add_path -m ~/.cargo/bin

# env
set -x BROWSER chromium
set -x EDITOR nvim
set -x XDG_CURRENT_DESKTOP sway
set -x XDG_SESSION_DESKTOP sway
set -x XDG_SESSION_TYPE wayland
set -x GTK_THEME Adwaita:dark

function fish_greeting -d "What's up, fish?"
    set_color $fish_color_autosuggestion
    uname -nmsr

    command -q uptime
    and command uptime

    set_color normal
end
