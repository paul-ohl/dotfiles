{ config, lib, pkgs, inputs, ... }:

{
  services.syncthing = {
    enable = true;
    extraFlags = [ "--no-default-folder" ];
    openDefaultPorts = true;
    guiAddress = "0.0.0.0:8384";
    configDir = "/home/astro/.config/syncthing";
    user="astro";
    group="users";

    settings = {
      gui = {
        tls = false;
      };

      devices = {
        "hornet".id = "CEGTXKA-GE57XYN-6MRJ3OK-6QGTQ27-DO54MEN-KLQL4RV-MPKYB2G-NP44ZQ6";
      };

      folders = {
        "org" = {
          path = "/home/astro/Documents/org/";
          devices = [ "hornet" ];
        };
        "zik" = {
          path = "/home/astro/Music/zik/";
          devices = [ "hornet" ];
        };
      };
    };
  };

  # Open the Syncthing GUI port
  networking.firewall.allowedTCPPorts = [ 8384 ];
}
