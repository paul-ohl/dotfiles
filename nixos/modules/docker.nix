{ config, lib, pkgs, inputs, username, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  users.users.${username}.extraGroups = [ "docker" ];
}
