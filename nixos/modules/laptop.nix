{ config, lib, pkgs, inputs, ... }:

{
  hardware.bluetooth.enable = true;

  # Enable touchpad support
  services.xserver.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    # Laptop utilities
    powertop
    acpi
    brightnessctl
  ];


  # Power management
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
}
