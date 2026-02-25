# ---------- Dotfiles management ----------
dotfiles() {
  GIT_DIR="$HOME/.dotfiles" GIT_WORK_TREE="$HOME" command git "$@"
}

# ---------- Secrets (never committed) ----------
# Machine-local API keys, tokens, etc. live in ~/.secrets
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# ---------- History ----------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ---------- Directory navigation ----------
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_SILENT
setopt PUSHD_IGNORE_DUPS
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'
alias d='dirs -v'

# ---------- Safety ----------
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# ---------- Aliases ----------
alias reload='source ~/.zshrc'
alias ll='ls -lAh'
alias la='ls -A'
alias l='ls -CF'
alias md='mkdir -p'
alias path='echo $PATH | tr ":" "\n"'

# ---------- Completions ----------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
compdef dotfiles=git

# ---------- Plugins ----------
# zsh-autosuggestions: shadow completion from history, accept with right arrow
# Install: brew install zsh-autosuggestions (macOS) / apt install zsh-autosuggestions (Debian/Ubuntu)
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ---------- Prompt ----------
eval "$(starship init zsh)"

# ---------- Machine-local interactive config ----------
# Machine-specific aliases, completions, plugins go in ~/.zshrc.local
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
