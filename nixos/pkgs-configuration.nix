{ config, lib, pkgs, modulesPath, ... }:

{

  # Programs
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
    firefox.enable = true;
    # enable Sway window manager
    sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
    neovim = {
      enable = true;
    };
    zsh = {
        enable = true;
        ohMyZsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [
            "sudo"
            "terraform"
            "systemadmin"
            "vi-mode"
          ];
        };
      };
  };
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    neovim              # Text editor
    wget                # Download files from the web
    kitty               # Terminal emulator
    hyprland            # Window manager
    hyprsome            # Hyprland plugin manager
    hyprlock            # Lock screen utility for Hyprland
    hyprpaper           # Wallpaper manager for Hyprland
    waybar              # Status bar for Wayland
    rofi-wayland        # Application launcher for Wayland
    wl-clipboard        # Clipboard manager for Wayland
    firefox             # Web browser
    git                 # Version control system
    gh                  # GitHub CLI tool
    killall             # Kill processes by name
    dmidecode           # Retrieve system hardware info
    lshw                # Display detailed hardware info

    # Shell utilities
    zsh                 # Z shell (alternative to bash)

    # Programming tools
    zip                 # Compression utility
    unzip               # Decompression utility
    python39            # Python interpreter (check version, may need python3)
    gcc                 # GNU Compiler Collection (C/C++ compiler)
    gdb                 # GNU Debugger
    lua                 # Lua programming language

    # System monitoring & visuals
    unimatrix           # Matrix-style terminal effect
    btop                # Resource monitor (CPU, RAM, etc.)
    tigervnc            # Remote desktop viewer
    neofetch            # System information tool

    # Neovim setup & development tools
    ripgrep             # Fast search tool (used in Neovim)
    clang-tools         # Clangd: C++ LSP and tools
    lua-language-server # Language server for Lua
    gnumake             # Build automation tool (Make)
    rust-analyzer       # Language server for Rust
    rustc		# Rust compiler

    ripgrep		# Speed grep
  ];
}

