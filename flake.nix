{
  description = "nix";
  # TODO: add directory structure diagram
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

        # work = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/work/config.nix
        #     ./system/work/hardware.nix
        #     inputs.home-manager.nixosModules.default
        #   ];
        # };

        # server = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/server/config.nix
        #     ./system/server/hardware.nix
        #     inputs.home-manager.nixosModules.default
        #   ];
        # };

        # desktop = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/desktop/config.nix
        #     ./system/desktop/hardware.nix
        #     inputs.home-manager.nixosModules.default
        #   ];
        # };
      };
    };
}
