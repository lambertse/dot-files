# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix  # Include the results of the hardware scan.
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader
  boot.loader = {
    grub.enable = true;
    grub.device = "/dev/sda";
  };

  # Networking
  networking = {
    hostName = "nixos";  # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy.default = "http://user:password@proxy:port/";  # Configure network proxy if necessary.
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";  # Proxy exceptions.

    networkmanager.enable = true;  # Enable networking
  };
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];
  fonts.fontconfig.enable = true;

  # Hardware
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
    };
  };
  # Time zone
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Internationalisation
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "vi_VN";
      LC_IDENTIFICATION = "vi_VN";
      LC_MEASUREMENT = "vi_VN";
      LC_MONETARY = "vi_VN";
      LC_NAME = "vi_VN";
      LC_NUMERIC = "vi_VN";
      LC_PAPER = "vi_VN";
      LC_TELEPHONE = "vi_VN";
      LC_TIME = "vi_VN";
    };
  };

  # Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Users
  users.users.lambert = {
    isNormalUser = true;
    description = "lambert";
    extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    packages = with pkgs; [];
  };

  services = {
    getty.autologinUser = "lambert";
  };

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
  };

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    wget
    kitty 			# Terminal
    hyprland			# Window manager
    hyprsome			# ...
    hyprlock			# Lock screen
    hyprpaper			# Wallpaper
    waybar 			# Waybar
    rofi-wayland		# Rofi
    wl-clipboard		# Capture
    firefox			
    git	
    gh				# Github cli
    p7zip
    killall				
    dmidecode 			# System's hardware info
    lshw

    #Programming
    zip
    unzip
    python3
    gcc
    gdb
    lua
    #

    # make color
    unimatrix			#
    btop			# Performance of machine
    tigervnc			# Remote

    # Neovim setup
    ripgrep			# Search utility
    clang-tools			# Clangd: C++ LSP
    gnumake			# Make
  ];

  # Services
  # services.openssh.enable = true;  # Enable the OpenSSH daemon.
  # networking.firewall = {  # Firewall settings
  #   allowedTCPPorts = [ ... ];
  #   allowedUDPPorts = [ ... ];
  #   enable = false;  # Or disable the firewall altogether.
  # };

  # System state version
  system.stateVersion = "24.11";  # Did you read the comment?
}

