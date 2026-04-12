# dot-files

Personal dotfiles for cross-platform development environments — works on Linux, macOS, and NixOS.

## Overview

This repository stores application configuration files shared across platforms and machines. The `nixos/` directory is kept for historical reference as NixOS was the original use case, but the primary focus is the `config/` directory which holds dotfiles applicable to any system.

The entire setup uses a unified **"Claude Code"** color scheme — a warm terracotta dark palette built around a near-black brown background (`#1a1815`) and orange accents (`#C15F3C`/`#E67D22`), applied consistently across the terminal, editor, shell, and status bar.

## Stack

| Category | Tool | Platform |
|---|---|---|
| Window Manager | Hyprland (Wayland) | Linux |
| Terminal | Ghostty / Kitty | macOS, Linux |
| Shell | Zsh + Oh My Zsh + Powerlevel10k | macOS, Linux |
| Editor | Neovim (LazyVim) | macOS, Linux |
| Multiplexer | tmux + tpm | macOS, Linux |
| Status Bar | Waybar | Linux (Wayland) |
| App Launcher | Rofi | Linux |
| Git TUI | Lazygit | macOS, Linux |
| System Monitor | btop | macOS, Linux |

## Structure

```
.
├── config/                      # Primary dotfiles (all platforms)
│   ├── nvim/                    # Neovim config (git submodule → lambertse/nvim)
│   ├── .tmux/                   # tmux: theme, options, bindings, plugins, utilities
│   ├── .zshrc                   # Zsh config with Oh My Zsh + p10k
│   ├── .p10k.zsh                # Powerlevel10k prompt config
│   ├── ghostty/                 # Ghostty terminal + claude-code theme
│   ├── kitty/                   # Kitty terminal keybindings and config
│   ├── lazygit/                 # Lazygit config
│   ├── btop/                    # btop resource monitor config
│   ├── hypr/                    # Hyprland WM + hyprlock + hyprpaper (Linux)
│   ├── waybar/                  # Wayland status bar config + CSS (Linux)
│   └── rofi/                    # Rofi launcher theme (Linux)
└── nixos/                       # NixOS system config (historical, Linux only)
    ├── configuration.nix
    ├── pkgs-configuration.nix
    └── hardware-configuration.nix
```

## Setup

### Clone

```bash
git clone --recurse-submodules https://github.com/lambertse/dot-files
```

If already cloned without submodules:

```bash
git submodule update --init --recursive
```

### Symlink dotfiles

Manually symlink or copy files from `config/` to their expected locations:

| Config | Target |
|---|---|
| `config/nvim/` | `~/.config/nvim` |
| `config/.tmux/` | `~/.tmux/` |
| `config/.tmux.conf` | `~/.tmux.conf` |
| `config/.zshrc` | `~/.zshrc` |
| `config/.p10k.zsh` | `~/.p10k.zsh` |
| `config/ghostty/` | `~/.config/ghostty/` |
| `config/kitty/` | `~/.config/kitty/` |
| `config/lazygit/` | `~/.config/lazygit/` |
| `config/btop/` | `~/.config/btop/` |
| `config/hypr/` | `~/.config/hypr/` *(Linux only)* |
| `config/waybar/` | `~/.config/waybar/` *(Linux only)* |

### NixOS (optional)

To apply the legacy NixOS system configuration:

```bash
sudo nixos-rebuild switch
```

## Neovim

The `config/nvim/` directory is a git submodule tracking [lambertse/nvim](https://github.com/lambertse/nvim), a [LazyVim](https://lazyvim.github.io)-based configuration.

Notable keymaps (on top of LazyVim defaults):

| Key | Action |
|---|---|
| `jj` | Escape to normal mode |
| `cc` | Copy to system clipboard |
| `cv` | Paste from system clipboard |
| `ss` / `sv` | Horizontal / vertical split |
| `<Space>ft` | Find files (Telescope) |
| `<Space>fl` | Live grep (Telescope) |
| `<Leader>T` | Toggle file tree (Neo-tree) |
| `<Leader>cct` | Toggle Copilot Chat |

## tmux

Config is split across `~/.tmux/`:

| File | Purpose |
|---|---|
| `theme.conf` | Claude Code color palette overriding catppuccin variables |
| `options.conf` | General tmux options |
| `bindings.conf` | Key bindings |
| `plugins.conf` | tpm plugin list (catppuccin, tmux-cpu) |
| `utilities.conf` | Utility settings |

Notable bindings (prefix is default `Ctrl-b`):

| Key | Action |
|---|---|
| `Prefix + \|` | Vertical split |
| `Prefix + -` | Horizontal split |
| `Prefix + h/j/k/l` | Navigate panes (vim-style) |
| `Prefix + r` | Reload config |
| `Prefix + Tab` | Next window |

## Hyprland

Key bindings defined in `config/hypr/hyprland.conf`:

| Key | Action |
|---|---|
| `Super + Q` | Open Kitty terminal |
| `Super + W` | Kill active window |
| `Super + Space` | Open Rofi launcher |
| `Super + L` | Lock screen (hyprlock) |
| `Super + N` | Cycle wallpaper |
| `Super + 1-9` | Switch workspace |

## Notes

- **clangd LSP**: The `clangd` binary installed by NixOS `clang-tools` may need to be copied into the Neovim/Mason path manually.
- **Zsh**: Oh My Zsh is installed separately from the system zsh package (see the NixOS README note).
- **Font**: [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts) is used in the terminal; Ghostty uses `PlemolJP Console NF`.
