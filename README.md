# tmux

Personal tmux configuration with catppuccin mocha theme, vi keybindings, and session management.

## Setup

```sh
git clone git@github.com:alcxyz/tmux.git ~/.config/tmux
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
tmux
# Press prefix + I to install plugins
```

## Prefix

`Ctrl-t`

## Key Bindings

| Key | Action |
|-----|--------|
| `prefix + s` | Split vertical |
| `prefix + v` | Split horizontal |
| `prefix + h/j/k/l` | Navigate panes |
| `prefix + H/L` | Previous / next window |
| `prefix + z` | Zoom pane |
| `prefix + c` | Kill pane |
| `prefix + x` | Swap pane |
| `prefix + R` | Reload config |
| `prefix + o` | Session picker (sesh + fzf) |
| `prefix + ,/.` | Resize pane left / right |
| `prefix + -/=` | Resize pane down / up |
| `Ctrl-n` | New Obsidian note (popup) |
| `Ctrl-q` | Search Obsidian (popup) |

## Plugins

| Plugin | Purpose |
|--------|---------|
| tpm | Plugin manager |
| tmux-sensible | Sensible defaults |
| tmux-yank | System clipboard integration |
| tmux-resurrect | Save/restore sessions |
| tmux-continuum | Auto-save sessions (every 5m) |
| tmux-thumbs | Quick copy text patterns |
| tmux-fzf | fzf integration |
| tmux-fzf-url | Open URLs with fzf |
| catppuccin-tmux | Catppuccin mocha theme |
| sesh | Session manager with fzf + zoxide (installed via nix) |

## Status Bar

`session | windows... | directory | host | time`

## Shell

Auto-detects default shell: nu > zsh > $SHELL
