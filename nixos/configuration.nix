# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  # Imports
  imports = [
    ./hardware-configuration.nix  # Include the results of the hardware scan.
    ./pkgs-configuration.nix	  # Packages
  ];

  # Nix settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  security.sudo.extraRules = [
    {
      users = [ "lambert" ];
      commands = [{ command = "ALL"; options = [ "NOPASSWD" ]; }];
    }
  ];

  # Bootloader
  boot.loader = {
    grub.enable = true;
    grub.device = "/dev/sda";
  };

  # Networking
  networking = {
    hostName = "nixos";  # Define your hostname.
    networkmanager.enable = true;  # Enable networking
  };
  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];
  fonts.fontconfig.enable = true;

  system.copySystemConfiguration = true;
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

  # System state version
  system.stateVersion = "24.11";  # Did you read the comment?
}
