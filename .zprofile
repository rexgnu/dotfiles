# ---------- Homebrew ----------
# macOS ARM (Apple Silicon)
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv zsh)"
# macOS Intel
[ -x /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv zsh)"
# Linux
[ -x /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
