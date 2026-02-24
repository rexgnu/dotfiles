# dotfiles

> "This is my dotfiles repo. There are many like it, but this one is mine.
> My dotfiles are my best friend. They are my life.
> Without me, my dotfiles are useless. Without my dotfiles, I am lost."

A bare git repo approach to keeping my shell, editor, and tools configured
the way I like them across every machine I touch. No extra tools, no symlink
farms — just git.

## Quick start on a new machine

```bash
curl -fsSL https://raw.githubusercontent.com/rexgnu/dotfiles/main/.local/bin/dotfiles-bootstrap | bash
```

Or manually:

```bash
git clone --bare https://github.com/rexgnu/dotfiles.git ~/.dotfiles
alias dotfiles='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'
dotfiles checkout
dotfiles config status.showUntrackedFiles no
```

If checkout complains about existing files, the bootstrap script will back
them up to `~/.dotfiles-backup/` automatically.

## Usage

The `dotfiles` alias works exactly like `git`, scoped to your home directory:

```bash
dotfiles status
dotfiles add ~/.vimrc
dotfiles commit -m "add vimrc"
dotfiles log
```

## Secrets

Secrets live in `~/.secrets` (created automatically, mode `600`, never
tracked). Your `.zshrc` sources it on startup. Put API keys, tokens, and
anything sensitive there — not in any tracked file.

A pre-commit hook will yell at you if you accidentally stage something
that looks like a secret. It's a safety net, not a substitute for paying
attention.

## Forking

Feel free to fork this and make it yours — that's the whole point. Strip out
anything personal, keep what's useful, and build your own muscle memory. If
you do something clever, I'd love to see it.

## License

[MIT](LICENSE) — do whatever you want with it.
