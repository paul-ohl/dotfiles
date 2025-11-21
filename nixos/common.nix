##
## Common configuration shared across all hosts
##

{ config, pkgs, pkgs-unstable, username, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Define your user account
  users.users.${username} = {
    isNormalUser = true;
    description = "Astrocephale";
    shell = pkgs.zsh;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    useOSProber = false;
  };

  # Networking
  networking.networkmanager.enable = true;

  # Time zone and internationalization
  time.timeZone = "Europe/Paris"; # Adjust to your timezone
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  # Common packages
  environment.systemPackages = with pkgs; [
    git
    htop
    stow
    vim
    wget
    zsh
  ];
  environment.systemPackages = with pkgs-unstable; [
    nvim
  ];

  programs.firefox.enable = true;

  # This value determines the NixOS release
  system.stateVersion = "25.05";
}
