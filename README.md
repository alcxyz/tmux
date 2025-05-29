# Tmux Configuration

This repository contains my personal tmux configuration, aiming for a productive and aesthetically pleasing terminal experience.

It's built around the **Tmux Plugin Manager (TPM)** and features the **Catppuccin** theme.

## Features

*   **Prefix:** `Ctrl+t`
*   **Plugin Management:** Uses [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm).
*   **Theme:** [Catppuccin](https://github.com/catppuccin/tmux) (specifically using omerxx's fork for custom scripts).
*   **Session Persistence:** `tmux-resurrect` and `tmux-continuum` for saving and restoring sessions.
*   **Clipboard Integration:** `tmux-yank`.
*   **FZF Integration:** For opening URLs (`tmux-fzf-url`) and other fuzzy finding tasks (`tmux-fzf`).
*   **Session Management:** `tmux-sessionx` for easy session switching/creation.
*   **Navigation:** Vi mode keys for pane navigation and copy mode.
*   **Mouse Support:** Enabled.
*   **Sensible Defaults:** Includes `tmux-sensible` for a good baseline.
*   Custom scripts for status bar elements (e.g., meetings).

## Prerequisites

*   **tmux** (version 2.1 or higher recommended for full compatibility with plugins)
*   **git** (for TPM and plugin installation)
*   **A Nerd Font** installed and configured in your terminal emulator for icons to display correctly (e.g., in the Catppuccin theme).
*   Your shell configured to find scripts in `~/.config/tmux/scripts/` if you rely on them outside of tmux directly. (Your `set_default_shell.sh` and `cal.sh` are examples).

## Installation

1.  **Clone this repository:**
    The configuration expects to be located at `~/.config/tmux/`.
    ```bash
    # Ensure the target directory exists
    mkdir -p ~/.config/tmux

    # Clone this repository into it
    git clone git@github.com:alcxyz/tmux.git ~/.config/tmux
    ```
    *Note: If you already have files in `~/.config/tmux/`, you might want to back them up or move them before cloning, or clone to a temporary location and then copy the files over.*

2.  **Install TPM (Tmux Plugin Manager):**
    If TPM is not already included (e.g., if you cloned this repo which should place TPM correctly if it's a submodule, or if you manage it separately):
    ```bash
    # This step might be redundant if your cloned repo already includes TPM in the correct path.
    # Only run if ~/.config/tmux/plugins/tpm doesn't exist after cloning your main config.
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    ```

3.  **Install Plugins:**
    *   Launch tmux.
    *   Press `Ctrl+t` (your prefix) then `I` (capital 'i') to fetch and install all plugins defined in `tmux.conf`.

## Usage

*   **Prefix:** `Ctrl+t`
*   **Reload tmux config:** `Prefix + R`
*   **Install new plugins (after adding to config):** `Prefix + I`
*   **Update plugins:** `Prefix + U`
*   **Uninstall plugins (removed from config):** `Prefix + Alt + u` (for "clean")

## Key Customizations to Note

*   **Configuration File:** `~/.config/tmux/tmux.conf`
*   **Reset File:** `~/.config/tmux/tmux.reset.conf` (sourced by `tmux.conf`)
*   **Custom Scripts:** Located in `~/.config/tmux/scripts/` (e.g., `set_default_shell.sh`, `cal.sh`). Ensure these are executable (`chmod +x <script_name>`).

---

Feel free to adapt this! You might want to:
*   Add a screenshot.
*   Go into more detail on specific keybindings if you have many custom ones you want to remember.
*   Mention the specific Catppuccin flavor if you've configured one (e.g., Mocha, Macchiato, Frappe, Latte).
