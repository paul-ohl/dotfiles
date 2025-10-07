# NixOS system configuration
{ config, pkgs, ... }:

{
  imports = [
    # Include hardware configuration (generate with: nixos-generate-config)
    # Uncomment and ensure this file exists:
    # ./hardware-configuration.nix
  ];

  # Boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages if needed
  nixpkgs.config.allowUnfree = true;

  # Time zone
  time.timeZone = "Europe/Brussels";

  # Internationalization
  i18n.defaultLocale = "en_US.UTF-8";

  # User account
  users.users.YOUR_USERNAME = {
    isNormalUser = true;
    description = "Your Name";
    extraGroups = [ "networkmanager" "wheel" ];
    # Optional: set user packages
    packages = with pkgs; [
      firefox
      thunderbird
    ];
  };

  # System-wide packages
  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    curl
    git
    htop
    tmux

    # CLI utilities
    ripgrep
    fd
    bat
    eza
    fzf

    # Development tools
    gcc
    gnumake

    # Add your preferred packages here
  ];

  # Enable common services
  services.openssh.enable = true;

  # Firewall configuration
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;

  # System state version - don't change after installation
  system.stateVersion = "24.05";
}
