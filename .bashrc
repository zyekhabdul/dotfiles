# ==========================================
# BEAUTIFUL BASH CONFIGURATION (ANTIGRAVITY / AGY)
# ==========================================

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# 1. Initialize Ble.sh (Bash Line Editor: Syntax Highlighting & Autosuggestions)
[[ $- == *i* ]] && [[ -f ~/.local/share/blesh/ble.sh ]] && source ~/.local/share/blesh/ble.sh --noattach

# Shell Options
shopt -s histappend
shopt -s checkwinsize

# History Settings
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=10000
HISTFILESIZE=10000
HISTFILE=~/.bash_history

# Completion & Readline Keybindings
bind 'set completion-ignore-case on' 2>/dev/null
bind 'set show-all-if-ambiguous on' 2>/dev/null
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward' 2>/dev/null

# Environment Paths
export PATH="/home/fuckadmin/.local/bin:/home/fuckadmin/.npm-global/bin:/home/fuckadmin/.kimi-code/bin:$PATH"
export EDITOR="nano"

# Spotify API Keys
export SPOTIPY_CLIENT_ID="fe72372028334f46a04c6fae217d18b7"
export SPOTIPY_CLIENT_SECRET="1103a42c84ec492bb1cf254e7326a87d"

# Aliases
alias ls="ls --color=auto"
alias ll="ls -la --color=auto"
alias grep="grep --color=auto"
alias cls="clear"
alias c="clear"
alias reload="source ~/.bashrc"
alias agy="agy --dangerously-skip-permissions"
# Kitty SSH integration (hanya aktif jika running di Kitty)
[[ -n "$KITTY_PID" ]] && alias ssh="kitten ssh"

# Advanced Bash Completion & FZF Integration
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

# Starship Prompt (Fast & Beautiful)
eval "$(starship init bash)"

# 2. Attach Ble.sh (Must be loaded at the very end of .bashrc)
[[ ${BLE_VERSION-} ]] && ble-attach
