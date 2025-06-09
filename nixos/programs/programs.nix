{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
    ./desktop.nix
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
    musicDirectory = "/home/astro/Music/zik/Kaleo/A_B";
    playlistDirectory = "/home/astro/Music/playlists";
    user = "astro";
    group = "audio";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };

  environment.systemPackages = with pkgs; [
    alacritty
    alejandra
    appimage-run
    bat
    btop
    clang
    curl
    discord
    dust
    eza
    fzf
    gcc
    kitty
    libnotify
    neovim
    nerd-fonts.mononoki
    nodejs-slim
    obsidian
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
}
