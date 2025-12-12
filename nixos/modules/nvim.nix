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
      bash-language-server # Bash
      clangd
      css-lsp
      docker-compose-language-service
      html-lsp
      json-lsp
      lua-language-server
      marksman # Markdown
      nixd # Nix
      prisma-language-server
      rust-analyzer
      tailwindcss-language-server
      typescript-language-server
      yamlls
      # gopls           # Go
      # pyright         # Python
      # zls             # Zig

      # Formatters for conform.nvim (add the ones you use)
      alejandra # Nix formatter
      biome
      nixpkgs-fmt # Nix (or nixfmt)
      stylua # Lua
      # black           # Python
      # clang-tools     # C/C++ (includes clang-format)
      # gofmt           # Go
      # prettier        # JS/TS/CSS/HTML/JSON/etc
      # rustfmt         # Rust (usually comes with rust-analyzer)

      typst
      typst-lsp
    ];
  };
}
