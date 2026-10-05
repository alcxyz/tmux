#!/usr/bin/env bash
# Set tmux's default shell, preferring zsh > $SHELL
if path=$(command -v zsh 2>/dev/null); then
  tmux set-option -g default-shell "$path"
else
  tmux set-option -g default-shell "$SHELL"
fi
