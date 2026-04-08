#!/usr/bin/env bash
# Set tmux's default shell, preferring nu > zsh > $SHELL
for shell in nu zsh; do
  path=$(command -v "$shell" 2>/dev/null) && break
done
tmux set-option -g default-shell "${path:-$SHELL}"
