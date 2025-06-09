{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./firefox.nix
  ];

  programs = {
    zsh.enable = true;
    vim.enable = true;

    git = {
      enable = true;
      config.init.defaultBranch = "main";
    };
  };

  environment.systemPackages = with pkgs; [
    tmux
    alacritty
    alejandra
    appimage-run
    bat
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
    ripgrep
    stow
    unzip
    vlc
    wget
  ];
}
