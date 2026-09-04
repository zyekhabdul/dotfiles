<div align="center">

# 🏛️ Sovereign Arch Linux Dotfiles

**Ultra-minimalist, keyboard-driven Linux environment powered by Niri scrollable Wayland compositor and deterministic AI agent harnesses.**

[![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org)
[![Wayland](https://img.shields.io/badge/Wayland-Niri-F95959?style=for-the-badge&logo=wayland&logoColor=white)](https://github.com/YaLTeR/niri)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![Neovim](https://img.shields.io/badge/NeoVim-%2357A143.svg?style=for-the-badge&logo=neovim&logoColor=white)](https://neovim.io)
[![Shell](https://img.shields.io/badge/ZSH-Starship-orange?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://starship.rs)

<br/>

[Overview](#-overview) •
[Stack & Architecture](#-stack--architecture) •
[Keybindings](#-keybindings-cheat-sheet) •
[Installation](#-installation) •
[Structure](#-repository-structure) •
[License](#-license)

</div>

---

## ⚡ Overview

Sovereign dotfiles is a curated, high-performance configuration designed for daily technical workflows, terminal-first productivity, and autonomous AI pair-programming. It ditches heavy desktop suites in favor of **Niri** (infinite horizontal scrolling tiling compositor) with lightweight Wayland utilities.

### Highlights
- 🪟 **Scrollable Tiling**: Infinite horizontal workspace organization via Niri.
- 🚀 **Sub-millisecond Terminal**: Foot client/server architecture and Ghostty integration.
- 🎨 **Unified Aesthetic**: High-contrast, dark-mode tuned palette across foot, nvim, fuzzel, and yambar.
- 🤖 **AI Agent SSOT Harness**: Pre-configured global rules (`.gemini/config/`) enforcing compiler-gated integrity and inspection-first workflows.
- 🛡️ **Zero Bloat / YAGNI**: Native tools prioritized over bulky abstractions.

---

## 🛠️ Stack & Architecture

| Component | Technology | Configuration Path |
| :--- | :--- | :--- |
| **Compositor** | Niri (Wayland) | `.config/niri/config.kdl` |
| **Terminal** | Foot / Ghostty | `.config/foot/foot.ini`, `.config/ghostty/config` |
| **Shell** | Zsh & Bash + Starship | `.zshrc`, `.bashrc`, `.config/starship.toml` |
| **Editor** | Neovim (NvChad base) | `.config/nvim/` |
| **Multiplexer** | Tmux + TPM plugins | `.config/tmux/tmux.conf` |
| **Launcher** | Fuzzel / Tofi | `.config/fuzzel/fuzzel.ini` |
| **Status Bar** | Yambar | `.config/yambar/config.yml` |
| **Notifications** | Fnott | `.config/fnott/fnott.ini` |
| **Lock Screen** | Waylock / Swaylock | `.config/swaylock/config` |
| **Monitoring** | Btop & Fastfetch | `.config/btop/`, `.config/fastfetch/` |
| **Agent Harness** | Antigravity AI Standards | `.gemini/config/` |

---

## ⌨️ Keybindings Cheat Sheet (Niri)

| Shortcut | Action |
| :--- | :--- |
| `Super + Enter` / `Super + T` | Spawn Foot terminal client |
| `Super + D` | Application launcher (Tofi / Fuzzel) |
| `Super + V` | Clipboard history manager |
| `Super + H / J / K / L` | Focus Left / Down / Up / Right column |
| `Super + Shift + H / L` | Move focused column horizontally |
| `Super + Shift + C` | Close active window |
| `Super + F` | Toggle fullscreen |
| `Super + R` | Switch column preset width |
| `Super + Alt + L` | Screen lock (Waylock) |
| `Super + Shift + /` | Open live interactive hotkey overlay |

---

## 📦 Installation

### Quick Start (Automated)

```bash
# Clone the repository
git clone https://github.com/zyekhabdul/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run automated symlink installer
chmod +x install.sh
./install.sh
```

> **Note**: The installer automatically safeguards your current configurations by archiving them into `~/.dotfiles_backup_<timestamp>/` before creating symlinks.

### Manual Linking (Modular)

If you only want specific modules (e.g. Niri & Foot):

```bash
mkdir -p ~/.config/niri ~/.config/foot
ln -sf ~/dotfiles/.config/niri/config.kdl ~/.config/niri/config.kdl
ln -sf ~/dotfiles/.config/foot/foot.ini ~/.config/foot/foot.ini
```

---

## 📂 Repository Structure

```text
dotfiles/
├── .config/
│   ├── btop/           # Resource monitor tuning
│   ├── fastfetch/      # System profile fetch branding
│   ├── fnott/          # Minimalist notification daemon
│   ├── foot/           # Ultra-fast Wayland terminal config
│   ├── fuzzel/         # Lightweight app launcher
│   ├── ghostty/        # Modern GPU terminal backup
│   ├── niri/           # Master Wayland scrollable tiling layout
│   ├── nvim/           # Neovim configuration suite
│   ├── tmux/           # Session management & status bar
│   └── yambar/         # Wayland status bar blocks
├── .gemini/config/     # Deterministic AI agent global governance rules
├── .bashrc             # Optimized Bash environment
├── .zshrc              # Interactive Zsh configuration
├── .gitconfig          # Git global defaults (SSH protocol enforcement)
├── install.sh          # One-click backup & symlink deployment
├── LICENSE             # MIT License
└── README.md           # Documentation
```

---

## 📄 License

Distributed under the **MIT License**. See [LICENSE](LICENSE) for details.

Developed & maintained by [zyekhabdul](https://github.com/zyekhabdul).
