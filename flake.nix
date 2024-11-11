{
  description = "NIL system flake";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs =
    { self, nixpkgs, chaotic, ... }@inputs:
    {
      nixosConfigurations = {
        t420 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./system/config.nix
            ./system/hardware/t420.nix
            inputs.home-manager.nixosModules.default
            chaotic.nixosModules.default
          ];
        };
      };
    };
}
