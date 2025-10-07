{
  description = "Astrocephale's NixOS configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs: 
    let
      system = "x86_64-linux";
    in
    {
      # NixOS configurations
      nixosConfigurations = {
        # Default NixOS configuration
        default = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
          ];
        };

        # Host-specific NixOS configurations
        Kryptonite = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/kryptonite.nix
          ];
        };

        jellybean = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./hosts/jellybean.nix
          ];
        };
      };
    };
}

# ~/dotfiles/nixos/shell-config.sh
# Shell configuration for non-NixOS systems
# Source this file in your .bashrc or .zshrc

# Ensure Nix is in PATH
if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
  . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
elif [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
  . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# Nix aliases
alias nix-update='cd ~/dotfiles/nixos && git pull && nix profile upgrade ".*"'
alias nix-gc='nix-collect-garbage -d'
alias nix-search='nix search nixpkgs'

# Custom functions
update-dotfiles() {
    echo "Updating dotfiles..."
    cd ~/dotfiles
    git pull

    if [ -f ~/dotfiles/nixos/user-packages.nix ]; then
        echo "Updating Nix packages..."
        nix profile upgrade ".*"
    fi

    echo "Reloading shell configuration..."
    source ~/dotfiles/nixos/shell-config.sh

    echo "Update complete!"
}

# Add custom PATH entries if needed
# export PATH="$HOME/.local/bin:$PATH"

# Environment variables
export EDITOR=vim
export VISUAL=vim

# ~/dotfiles/nixos/hosts/my-desktop.nix
# Example host-specific NixOS configuration for desktop
{ config, pkgs, ... }:

{
  networking.hostName = "my-desktop";

  # Desktop-specific hardware
  # imports = [ ./my-desktop-hardware.nix ];

  # Enable X11 and Desktop Environment
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Keyboard layout
    xkb.layout = "us";
  };

  # Audio
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Desktop-specific packages
  environment.systemPackages = with pkgs; [
    # GUI applications
    vscode
    gimp
    vlc

    # Desktop utilities
    gnome.gnome-tweaks
  ];

  # Enable CUPS for printing
  services.printing.enable = true;

  # Graphics drivers (uncomment for NVIDIA)
  # services.xserver.videoDrivers = [ "nvidia" ];
  # hardware.nvidia.modesetting.enable = true;
}

# ~/dotfiles/nixos/hosts/my-laptop.nix
# Example host-specific NixOS configuration for laptop
{ config, pkgs, ... }:

{
  networking.hostName = "my-laptop";

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
