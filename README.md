# Sovereign Linux Dotfiles (Arch Linux / Niri Wayland)

Modular, lightweight, and native-first dotfiles for Arch Linux with Niri Wayland scrollable tiling compositor.

## Overview

- **Compositor**: Niri Wayland (`.config/niri/config.kdl`)
- **Shell**: Bash & Zsh (`.bashrc`, `.zshrc`) with Starship prompt (`.config/starship.toml`)
- **Terminals**: Foot (`.config/foot/foot.ini`), Ghostty (`.config/ghostty/config`)
- **App Launcher**: Fuzzel (`.config/fuzzel/fuzzel.ini`)
- **Notification Daemon**: Fnott (`.config/fnott/fnott.ini`)
- **Status Bar**: Yambar (`.config/yambar/config.yml`)
- **System Monitoring**: Btop (`.config/btop/btop.conf`), Fastfetch (`.config/fastfetch/config.jsonc`)
- **Multiplexer & Editor**: Tmux (`.config/tmux/tmux.conf`), Neovim (`.config/nvim/`)
- **AI Agent Standards**: Global Antigravity / Agent Rules (`.gemini/config/`)

## Installation

```bash
# Clone or extract to ~/dotfiles
cd ~/dotfiles
./install.sh
```

Existing configuration files are automatically backed up to `~/.dotfiles_backup_<timestamp>/`.
