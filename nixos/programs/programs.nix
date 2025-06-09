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
    musicDirectory = "/home/astro/Music/zik";
    playlistDirectory = "/home/astro/Music/playlists";
    user = "astro";
    group = "audio";
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
    mpd
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
  ];
}
