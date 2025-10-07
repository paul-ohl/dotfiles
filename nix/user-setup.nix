{
  config,
  pkgs,
  ...
}: {
  users.users.astro = {
    isNormalUser = true;
    description = "AstroCephale";
    extraGroups = ["networkmanager" "wheel" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Enable auto-login
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "astro";
}
