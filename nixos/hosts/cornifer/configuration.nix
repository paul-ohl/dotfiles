{ config, pkgs, pkgs-unstable, ... }:

{
  # Host-specific configuration for cornifer
  networking.hostName = "cornifer";

  # Enable X11 and desktop environment
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ 80 443 8096 4533 4534 ];
  };

  # Disable system suspend
  systemd.targets = {
    sleep.enable = false;
    suspend.enable = false;
    hibernate.enable = false;
    hybrid-sleep.enable = false;
  };

  # Host-specific packages
  environment.systemPackages = with pkgs; [
    # Add packages specific to this machine
  ] ++ [
    # Example of using unstable packages
    # pkgs-unstable.some-package
  ];
}
