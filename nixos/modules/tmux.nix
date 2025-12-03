{ pkgs, ... }:

{
  programs.tmux.enable = true;
  programs.tmux.package = pkgs.tmux;

  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    sensible
    tmux-sessionx
    yank
    # continuum
    # resurrect
  ];

  # If a plugin needs extra tmux conf lines, you can add them via programs.tmux.extraConfig
  programs.tmux.extraConfig = ''
    # example extra tmux config lines
  '';
}
