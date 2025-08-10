{
  description = "nix";
  # TODO: add directory structure diagram
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      myUser = "nh";
    in
    {
      nixosConfigurations = {
        t420 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs myUser;
          };
          modules = [
            ./system/hosts/t420/config.nix
            ./system/hosts/t420/hardware.nix
          ];
        };

        # work = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/work/config.nix
        #     ./system/work/hardware.nix
        #   ];
        # };

        # server = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/server/config.nix
        #     ./system/server/hardware.nix
        #   ];
        # };

        # desktop = nixpkgs.lib.nixosSystem {
        #   specialArgs = {
        #     inherit inputs myUser;
        #   };
        #   modules = [
        #     ./system/desktop/config.nix
        #     ./system/desktop/hardware.nix
        #   ];
        # };
      };
    };
}
