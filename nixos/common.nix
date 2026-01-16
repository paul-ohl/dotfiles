##
## Common configuration shared across all hosts
##

{ config, pkgs, pkgs-unstable, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Define your user account
  users.users.astro = {
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
    efiSupport = true;
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
    alejandra
    fzf
    gcc
    git
    gnumake
    htop
    stow
    unzip
    vim
    wget
    zsh
  ] ++ [
    # Unstable packages
    pkgs-unstable.bat
    pkgs-unstable.btop
    pkgs-unstable.delta
    pkgs-unstable.dust
    pkgs-unstable.dysk
    pkgs-unstable.eza
    pkgs-unstable.fd
    pkgs-unstable.lazygit
    pkgs-unstable.neovim
    pkgs-unstable.nerd-fonts.mononoki
    pkgs-unstable.ripgrep
  ];

  programs.zsh.enable = true;

  # Create the directories I want present on the computer.
  systemd.tmpfiles.rules = [
    "d /opt/dev 0770 astro users -"
    "d /opt/mds 0770 astro users -"
    "d /home/astro/Documents/dev 0770 astro users -"
  ];

  # This value determines the NixOS release
  system.stateVersion = "25.05";
}
