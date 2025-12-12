{ config, pkgs, pkgs-unstable, ... }:

{
  # Host-specific configuration for knight
  networking.hostName = "knight";

  # Enable X11 and desktop environment
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Host-specific packages
  environment.systemPackages = with pkgs; [
    # Add packages specific to this machine
  ] ++ [
    # Example of using unstable packages
    # pkgs-unstable.some-package
  ];
}
