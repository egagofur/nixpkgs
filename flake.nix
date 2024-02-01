{
  description = "Nix Darwin Ega Gofur";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, darwin, nixvim, ... }@inputs: {
    darwinConfigurations.egas-MacBook-Pro = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [
        ./system
        home-manager.darwinModules.home-manager
        ({ config, pkgs, lib, ... }: {
          nixpkgs = {
            config = { allowUnfree = true; };
            system = "aarch64-darwin";
          };

          nix.nixPath = { nixpkgs = "${inputs.nixpkgs}"; };

          users.users.egagofur = {
            home = "/Users/egagofur";
            shell = pkgs.zsh;
          };

          home-manager.useGlobalPkgs = true;
          home-manager.users.egagofur = {
            imports = [ ./home ];
            home.stateVersion = "23.11";
          };
        })
      ];
    };
  };
}
