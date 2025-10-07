{ config, pkgs, ... }:

{
  networking.hostName = "Kryptonite";

  # Laptop-specific hardware
  # imports = [ ./my-laptop-hardware.nix ];

  # Enable X11 with a lighter desktop environment
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
  };

  # Power management for laptop
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      # Battery thresholds (uncomment for ThinkPad)
      # START_CHARGE_THRESH_BAT0 = 75;
      # STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  # Laptop-specific packages
  environment.systemPackages = with pkgs; [
    # Laptop utilities
    powertop
    acpi
    brightnessctl
  ];

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
