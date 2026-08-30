# ==========================================
# 🚀 BEAUTIFUL ZSH CONFIGURATION (ANTIGRAVITY / AGY)
# ==========================================

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Completion & Tab menu
autoload -Uz compinit
compinit -d ~/.zcompdump
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
zstyle ':completion:*' menu select

# Key bindings (Up/Down arrow history search)
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Environment Paths
export PATH="/home/fuckadmin/.local/bin:/home/fuckadmin/.npm-global/bin:/home/fuckadmin/.kimi-code/bin:$PATH"
export EDITOR="nano"

# Useful Aliases
alias agy="agy --dangerously-skip-permissions"
alias ll="ls -la --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias cls="clear"
alias c="clear"
alias reload="source ~/.zshrc"
# Kitty SSH integration (hanya aktif jika running di Kitty)
[[ -n "$KITTY_PID" ]] && alias ssh="kitten ssh"

# Advanced FZF Integration (Fuzzy History & File Finder)
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh
[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Starship Prompt (Fast & Beautiful)
eval "$(starship init zsh)"

# Spotify API Keys
export SPOTIPY_CLIENT_ID="fe72372028334f46a04c6fae217d18b7"
export SPOTIPY_CLIENT_SECRET="1103a42c84ec492bb1cf254e7326a87d"

# Interactive SSH Manager (FZF + Metadata Preview)
sshm() {
    local target
    target=$(awk '/^Host / {for(i=2;i<=NF;i++) if($i !~ /[*?]/) print $i}' ~/.ssh/config | \
        fzf --prompt="[ SSH Connect ] > " \
            --height=50% \
            --layout=reverse \
            --border=rounded \
            --preview='ssh -G {} 2>/dev/null | grep -E "^(hostname|user|port|identityfile|proxyjump|forwardagent) " | column -t' \
            --preview-window=right:55%:border-left)

    if [[ -n "$target" ]]; then
        echo "[ NOTE ] Connecting to: $target"
        ssh "$target"
    fi
}

# Force Blinking Block Cursor (DECSCUSR 1)
export GHOSTTY_SHELL_FEATURES="${GHOSTTY_SHELL_FEATURES//cursor/no-cursor}"
_fix_cursor() {
    printf '\e[1 q'
}
autoload -Uz add-zsh-hook 2>/dev/null
add-zsh-hook precmd _fix_cursor 2>/dev/null

zle-line-init() {
    printf '\e[1 q'
}
zle-keymap-select() {
    printf '\e[1 q'
}
zle -N zle-line-init 2>/dev/null
zle -N zle-keymap-select 2>/dev/null
printf '\e[1 q'



