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
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # Networking
  networking = {
    hostName = "nixos";  # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # proxy.default = "http://user:password@proxy:port/";  # Configure network proxy if necessary.
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";  # Proxy exceptions.

    networkmanager.enable = true;  # Enable networking
  };

  # Hardware
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
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

  # Automatic login
  services.getty.autologinUser = "lambert";

  # Programs
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    hyprlock.enable = true;
    firefox.enable = true;
  };

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    wget
    foot
    hyprland
    hyprsome
    hyprlock
    waybar
    rofi-wayland
    wl-clipboard
    firefox
    git
    p7zip
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

