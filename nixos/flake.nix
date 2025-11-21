{
  description = "Astro's Hallownest";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      username = "astro";

      # Helper function to create system configurations
      mkSystem = hostname: extraModules: nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit inputs username;
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
          ./modules/tailscale.nix
          ./modules/nvidia.nix
          # ./modules/gaming.nix
          ./modules/audio.nix
          ./modules/docker.nix
        ];

        cornifer = mkSystem "cornifer" [
          ./modules/tailscale.nix
          ./modules/docker.nix
          ./modules/ssh-daemon.nix
        ];

        knight = mkSystem "knight" [
          ./modules/tailscale.nix
          ./modules/docker.nix
          ./modules/audio.nix
          # ./modules/gaming.nix
        ];
      };
    };
}
