#!/usr/bin/env bash
# ==============================================================================
# DOTFILES INSTALLER - SOVEREIGN LINUX ENVIRONMENT (ARCH / NIRI / WAYLAND)
# Idempotent, safe symlink-based installer with automated backup
# ==============================================================================

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="${HOME}/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
DRY_RUN=0

log_info() {
    printf "\033[32m[ INFO ]\033[0m %s\n" "$1"
}

log_warn() {
    printf "\033[33m[ WARN ]\033[0m %s\n" "$1"
}

log_action() {
    printf "\033[34m[ LINK ]\033[0m %s -> %s\n" "$1" "$2"
}

link_file() {
    local src="$1"
    local dest="$2"

    if [ ! -e "$src" ]; then
        log_warn "Source does not exist: $src"
        return
    fi

    # Create destination parent directory if missing
    local dest_dir
    dest_dir="$(dirname "$dest")"
    if [ ! -d "$dest_dir" ]; then
        if [ "$DRY_RUN" -eq 1 ]; then
            log_info "[DRY-RUN] Would create directory: $dest_dir"
        else
            mkdir -p "$dest_dir"
        fi
    fi

    # Backup if destination exists and is not already the right symlink
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
            log_info "Already linked: $dest"
            return
        fi

        if [ "$DRY_RUN" -eq 1 ]; then
            log_warn "[DRY-RUN] Would backup: $dest -> $BACKUP_DIR/"
        else
            mkdir -p "$BACKUP_DIR"
            mv "$dest" "$BACKUP_DIR/"
            log_warn "Backed up existing: $dest -> $BACKUP_DIR/"
        fi
    fi

    if [ "$DRY_RUN" -eq 1 ]; then
        log_action "$src" "$dest (DRY-RUN)"
    else
        ln -sf "$src" "$dest"
        log_action "$src" "$dest"
    fi
}

main() {
    log_info "Starting dotfiles installation from: $DOTFILES_DIR"

    # 1. Shell & Core Home Dotfiles
    link_file "${DOTFILES_DIR}/.bashrc" "${HOME}/.bashrc"
    link_file "${DOTFILES_DIR}/.zshrc" "${HOME}/.zshrc"
    link_file "${DOTFILES_DIR}/.gitconfig" "${HOME}/.gitconfig"

    # 2. XDG Config (.config) Apps
    local config_items=(
        "niri"
        "foot"
        "ghostty"
        "fuzzel"
        "fnott"
        "yambar"
        "fastfetch"
        "btop"
        "swaylock"
        "tmux"
        "nvim"
        "starship.toml"
    )

    for item in "${config_items[@]}"; do
        link_file "${DOTFILES_DIR}/.config/${item}" "${HOME}/.config/${item}"
    done

    # 3. AI Agent Standards & Master Rules (.gemini/config)
    link_file "${DOTFILES_DIR}/.gemini/config" "${HOME}/.gemini/config"

    log_info "[ VERIFIED ] Dotfiles installation completed successfully."
    if [ -d "$BACKUP_DIR" ]; then
        log_info "Backups saved to: $BACKUP_DIR"
    fi
}

main "$@"
