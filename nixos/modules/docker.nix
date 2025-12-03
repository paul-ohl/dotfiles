{ config, lib, pkgs, inputs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  users.users.astro.extraGroups = [ "docker" ];
}
