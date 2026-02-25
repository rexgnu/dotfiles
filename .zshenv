# ---------- Core PATH ----------
export PATH="$HOME/.local/bin:$PATH"

# ---------- Machine-local environment ----------
# Tool-specific PATH additions (NVM, Cargo, pnpm, etc.) go in ~/.zshenv.local
[ -f "$HOME/.zshenv.local" ] && . "$HOME/.zshenv.local"
