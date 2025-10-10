{ ... }:

{
  networking.hostName = "jellybean";
  services.openssh.enable = true;
  nix.allowedUsers = [ "@wheel" ];
}
