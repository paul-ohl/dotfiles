{
  description = "Astro's Hallownest";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";

      # Helper function to create system configurations
      mkSystem = hostname: extraModules: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
          };
        };
        modules = [
          ./hosts/${hostname}/configuration.nix
          ./hosts/${hostname}/hardware-configuration.nix
          ./common.nix
        ] ++ extraModules;
      };
    in
    {
      nixosConfigurations = {
        hornet = mkSystem "hornet" [
          ./modules/audio.nix
          ./modules/docker.nix
          ./modules/firefox.nix
          ./modules/nvidia.nix
          ./modules/syncthing.nix
          ./modules/tailscale.nix
          ./modules/tmux.nix
        ];

        cornifer = mkSystem "cornifer" [
          ./modules/docker.nix
          ./modules/ssh-daemon.nix
          ./modules/syncthing.nix
          ./modules/tailscale.nix
          ./modules/tmux.nix
        ];

        knight = mkSystem "knight" [
          ./modules/audio.nix
          ./modules/docker.nix
          ./modules/syncthing.nix
          ./modules/tailscale.nix
        ];
      };
    };
}
