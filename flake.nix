{

  description = "My First Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-unstable, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      overlays = import ./overlays { inherit inputs; };

      nixosConfigurations = {
        nixosDesktop = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ./modules/syncthing.nix ];
        };
        nixosWin2old = lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix
            ./modules/syncthing.nix
            # ./devices/win2.nix  #from Wimpy's nix config
            ./modules/steam.nix
            # ./modules/wifi.nix
          ];
        };
        nixosWin2 = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./base-config-tty.nix
            ./base-config-gui.nix
            ./config-nixosWin2.nix
            ./modules/syncthing.nix
            ./devices/win2.nix
            ./modules/steam.nix
            # ./modules/wifi.nix
          ];
        };
        nixosWinMax2 = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./base-config-tty.nix
            ./base-config-gui.nix
            ./config-nixosWinMax2.nix
            ./modules/syncthing.nix
            # ./devices/win2.nix
            ./modules/steam.nix
            # ./modules/wifi.nix
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
