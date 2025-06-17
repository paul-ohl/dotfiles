{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./desktop.nix
  ];

  environment.systemPackages = with pkgs; [
    webcamoid

    alacritty
    alejandra
    appimage-run
    bat
    bitwarden
    bitwarden-cli
    btop
    clang
    curl
    delta
    discord
    dust
    eza
    fzf
    gcc
    kitty
    lazygit
    libnotify
    linuxKernel.packages.linux_6_6.broadcom_sta # Broadcom wireless driver
    linuxKernel.packages.linux_6_6.facetimehd # FaceTime HD camera driver
    neovim
    nerd-fonts.mononoki
    nodejs-slim
    obsidian
    # ollama-cuda
    openssl
    qutebrowser
    ripgrep
    rmpc
    stow
    tmux
    unzip
    vlc
    wget
    yazi
  ];

  programs = {
    zsh.enable = true;
    vim.enable = true;

    git = {
      enable = true;
      config.init.defaultBranch = "main";
    };
  };

  services.mpd = {
    enable = true;
    musicDirectory = "/home/astro/Music";
    user = "astro";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "Pipewire Output"
      }
    '';
  };

  systemd = {
    services = {
      mpd.environment = {
        XDG_RUNTIME_DIR = "/run/user/1000";
      };
    };
  };

  virtualisation.docker.enable = true;
}
