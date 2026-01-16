# modules/neovim.nix
{ config, pkgs, pkgs-unstable, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = nil;
    vimAlias = nil;

    # Plugins with native/compiled components
    plugins = with pkgs.vimPlugins; [
      telescope-fzf-native-nvim
      # Treesitter with all grammars pre-compiled
      nvim-treesitter.withAllGrammars

      # Blink.cmp - has Rust components
      blink-cmp
    ];

    # External tools that plugins depend on
    extraPackages = with pkgs; [
      # Core tools for telescope and general use
      ripgrep
      fd
      git

      # Build tools (in case lazy needs to compile something)
      gcc
      gnumake
      pkg-config

      # Tools for specific plugins
      lazygit
      zk
      nodejs_22 # for copilot.lua

      # Language servers (add the ones you use)
      lua-language-server
      clang-tools       # provides clangd
      docker-compose-language-service
      nodePackages.dockerfile-language-server-nodejs
      rust-analyzer
      nodePackages.typescript-language-server
      tailwindcss-language-server
      biome
      yaml-language-server

      # Formatters for conform.nvim (add the ones you use)
      alejandra # Nix formatter
      biome
      nixpkgs-fmt # Nix (or nixfmt)
      stylua # Lua

      typst
      typst-lsp
    ];
  };
}
