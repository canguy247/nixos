{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        nixosDesktop = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ./modules/syncthing.nix ];
        };
        win2 = {
          inherit system;
          modules = [
            ./configuration.nix
            ./modules/syncthing.nix
            ./devices/win2.nix
            ./modules/steam.nix
            ./modules/wifi.nix
          ];
        };
      };

      homeConfigurations = {
        methots = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
        };
      };
    };

}
