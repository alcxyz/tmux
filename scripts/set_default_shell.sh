#!/usr/bin/env bash

# This script sets the default shell for tmux, prioritizing based on common
# installation paths and user preference, particularly for NixOS and macOS.

# Function to check if a command exists and is executable
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# --- Shell Prioritization ---
# We'll try to find shells in a specific order:
# 1. NuShell (NixOS, then common installations)
# 2. Zsh (NixOS, then common installations)
# 3. Bash (common installations)
# 4. Fallback to the system's default SHELL

# NixOS specific paths for shells
NIX_PROFILE_BIN="${HOME}/.nix-profile/bin"
NIX_STORE_BIN="/run/current-system/sw/bin" # For system-wide Nix installations on NixOS

# --- Determine the default shell ---
DEFAULT_SHELL=""

# 1. Try NuShell (Nushell is often installed via cargo or Nix)
if [ -x "${NIX_PROFILE_BIN}/nu" ]; then
    DEFAULT_SHELL="${NIX_PROFILE_BIN}/nu"
elif command_exists nu; then
    DEFAULT_SHELL=$(command -v nu)
fi

# 2. If NuShell not found or not preferred, try Zsh
if [ -z "${DEFAULT_SHELL}" ]; then
    if [ -x "${NIX_PROFILE_BIN}/zsh" ]; then
        DEFAULT_SHELL="${NIX_PROFILE_BIN}/zsh"
    elif [ -x "${NIX_STORE_BIN}/zsh" ]; then
        DEFAULT_SHELL="${NIX_STORE_BIN}/zsh"
    elif [ -x "/usr/local/bin/zsh" ]; then # macOS Homebrew or custom installs
        DEFAULT_SHELL="/usr/local/bin/zsh"
    elif [ -x "/usr/bin/zsh" ]; then # Common Linux path
        DEFAULT_SHELL="/usr/bin/zsh"
    elif [ -x "/bin/zsh" ]; then # Other common Linux path
        DEFAULT_SHELL="/bin/zsh"
    fi
fi

# 3. If still no shell found, try Bash
if [ -z "${DEFAULT_SHELL}" ]; then
    if [ -x "${NIX_PROFILE_BIN}/bash" ]; then
        DEFAULT_SHELL="${NIX_PROFILE_BIN}/bash"
    elif [ -x "${NIX_STORE_BIN}/bash" ]; then
        DEFAULT_SHELL="${NIX_STORE_BIN}/bash"
    elif [ -x "/usr/local/bin/bash" ]; then # macOS Homebrew or custom installs
        DEFAULT_SHELL="/usr/local/bin/bash"
    elif [ -x "/usr/bin/bash" ]; then # Common Linux path
        DEFAULT_SHELL="/usr/bin/bash"
    elif [ -x "/bin/bash" ]; then # Other common Linux path
        DEFAULT_SHELL="/bin/bash"
    fi
fi

# 4. Fallback to the user's SHELL environment variable
if [ -z "${DEFAULT_SHELL}" ]; then
    DEFAULT_SHELL="${SHELL}"
fi

# Set the default shell in tmux
tmux set-option -g default-shell "${DEFAULT_SHELL}"
