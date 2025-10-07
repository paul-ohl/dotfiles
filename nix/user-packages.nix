# User packages for non-NixOS systems
# Install with: nix profile install --impure --file user-packages.nix

{ pkgs ? import <nixpkgs> {} }:

with pkgs; [
  # Development tools
  git
  vim
  neovim
  tmux

  # CLI utilities
  htop
  ripgrep
  fd
  bat
  eza
  fzf
  jq
  tree

  # Build tools
  gcc
  gnumake
  cmake

  # Languages and runtimes (add as needed)
  # python3
  # nodejs
  # go
  # rustc
  # cargo

  # Add your packages here
]
