{ config, pkgs, pkgs-unstable, ... }:

{
  # Host-specific configuration for hornet
  networking.hostName = "cornifer";

  # Enable X11 and desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Define your user account
  users.users.astro = {
    isNormalUser = true;
    description = "Astrocephale";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Host-specific packages
  environment.systemPackages = with pkgs; [
    # Add packages specific to this machine
  ] ++ [
    # Example of using unstable packages
    # pkgs-unstable.some-package
  ];
}
