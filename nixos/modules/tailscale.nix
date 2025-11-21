{ config, lib, pkgs, inputs, ... }:

{
  services.tailscale.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall = {
    allowedUDPPorts = [ 41641 ]; # Tailscale's default port
  };
}
