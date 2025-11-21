##
## Common configuration shared across all hosts
##

{ config, pkgs, pkgs-unstable, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader (adjust as needed)
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Time zone and internationalization
  time.timeZone = "Europe/Paris"; # Adjust to your timezone
  i18n.defaultLocale = "en_US.UTF-8";

  # Common packages
  environment.systemPackages = with pkgs; [
    vim
    pkgs-unstable.nvim
    wget
    git
    htop
  ];

  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # This value determines the NixOS release
  system.stateVersion = "25.05";
}
