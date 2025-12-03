{ config, lib, pkgs, inputs, ... }:

{
  services.syncthing = {
    enable = true;
    extraFlags = [ "--no-default-folder" ];
    openDefaultPorts = true;
    settings = {
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
}
