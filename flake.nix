{
  description = "nix";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      myUser = "nickh";
    in
    {
      nixosConfigurations = {
        t420 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs myUser;
          };
          modules = [
            ./system/t420/config.nix
            ./system/t420/hardware.nix
            inputs.home-manager.nixosModules.default
          ];
        };
        #work
        #desktop
        #server
      };
    };
}
