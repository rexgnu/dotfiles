# ---------- Dotfiles management ----------
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'

# ---------- Secrets (never committed) ----------
# Machine-local API keys, tokens, etc. live in ~/.secrets
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# ---------- Shell ----------
source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# ---------- Path ----------
. "$HOME/.local/bin/env"
