# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Cross-platform dotfiles for user `lambert`, targeting Linux, macOS, and NixOS. Two directories:
1. **`config/`** — primary dotfiles, applicable to any platform
2. **`nixos/`** — legacy NixOS system configuration (historical reference; `nixos/` is rarely edited)

## Setup

Clone with submodules:
```bash
git clone --recurse-submodules https://github.com/lambertse/dot-files
# or if already cloned:
git submodule update --init --recursive
```

Symlink `config/` entries to their targets:

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

## Applying Changes

**NixOS system config** (on the NixOS machine):
```bash
sudo nixos-rebuild switch
```

**Tmux config reload** (from within tmux):
```
Prefix + r
```

**Neovim plugin updates** (from within Neovim):
```
:Lazy sync
```

**Update git submodules**:
```bash
git submodule update --remote
```

## Architecture

### Config (`config/`)

- **Neovim** (`config/nvim/`) — git submodule → [`lambertse/nvim`](https://github.com/lambertse/nvim). [LazyVim](https://lazyvim.github.io)-based. Plugin spec in `lua/config/lazy.lua`; keymaps in `lua/config/keymaps.lua`; options in `lua/config/options.lua`.
- **tmux** — entry point `config/.tmux.conf` sources files from `config/.tmux/`: `theme.conf` (color overrides), `options.conf`, `bindings.conf`, `plugins.conf` (tpm, catppuccin, tmux-cpu), `utilities.conf`.
- **Zsh** (`config/.zshrc`) — Oh My Zsh + Powerlevel10k. Prompt config in `config/.p10k.zsh`.
- **Ghostty** (`config/ghostty/`) — custom `claude-code` theme in `config/ghostty/themes/claude-code`.
- **Kitty** (`config/kitty/`) — terminal keybindings and config.
- **Hyprland** (`config/hypr/`) — Wayland compositor. Starts waybar and hyprpaper on login. Wallpaper scripts in `config/hypr/hyprpaper/`.
- **Waybar** (`config/waybar/`) — Wayland status bar; `config` is JSON, `style.css` is styling.
- **Rofi** (`config/rofi/`) — app launcher theme (Linux).
- **Lazygit** (`config/lazygit/`) — git TUI config.
- **btop** (`config/btop/`) — system monitor config.

### NixOS (`nixos/`) — legacy

- `configuration.nix` — bootloader, networking, users, fonts, hardware
- `pkgs-configuration.nix` — system packages and enabled programs
- `hardware-configuration.nix` — auto-generated, rarely edited

### Color scheme

All configs share the **"Claude Code"** warm dark palette: near-black brown background (`#1a1815`), Claude orange accents (`#C15F3C`/`#E67D22`), muted warm neutrals. Defined in `config/ghostty/themes/claude-code`; `tmux/theme.conf` overrides catppuccin variables with these values; Zsh `LS_COLORS`/`FZF_DEFAULT_OPTS` apply it to the shell.

## Key Bindings Reference

### Neovim (custom, on top of LazyVim defaults)

| Key | Action |
|---|---|
| `jj` | Escape to normal mode |
| `cc` / `cv` | Copy / paste system clipboard |
| `ss` / `sv` | Horizontal / vertical split |
| `<Space>ft` | Find files (Telescope) |
| `<Space>fl` | Live grep (Telescope) |
| `<Leader>T` | Toggle file tree (Neo-tree) |
| `<Leader>cct` | Toggle Copilot Chat |

### tmux (prefix is `Ctrl-b`)

| Key | Action |
|---|---|
| `Prefix + \|` | Vertical split |
| `Prefix + -` | Horizontal split |
| `Prefix + h/j/k/l` | Navigate panes (vim-style) |
| `Prefix + r` | Reload config |
| `Prefix + Tab` | Next window |

### Hyprland

| Key | Action |
|---|---|
| `Super + Q` | Open Kitty terminal |
| `Super + W` | Kill active window |
| `Super + Space` | Open Rofi launcher |
| `Super + L` | Lock screen (hyprlock) |
| `Super + N` | Cycle wallpaper |
| `Super + 1-9` | Switch workspace |

## Notes

- **Font**: JetBrains Mono Nerd Font in the terminal; Ghostty uses `PlemolJP Console NF`.
- **clangd LSP**: The `clangd` binary from NixOS `clang-tools` may need to be copied into the Neovim/Mason path manually.
- **Zsh**: Oh My Zsh is installed separately from the system zsh package.
