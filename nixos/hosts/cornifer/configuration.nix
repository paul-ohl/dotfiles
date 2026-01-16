{ config, pkgs, pkgs-unstable, ... }:

{
  # Host-specific configuration for cornifer
  networking.hostName = "cornifer";

  # Enable X11 and desktop environment
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  networking.firewall = {
    # All these allowed ports are for services hosted with docker
    allowedTCPPorts = [
      80
      443
      3001
      4533
      4534
      7676
      8096
      8191
      8686
      8989
      9091
      9117
    ];
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
