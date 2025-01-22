{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  # Don't forget to set a password with ‘passwd’.
  users.users.nickh = {
    isNormalUser = true;
    description = "nickh";
    initialPassword = "1337";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "nickh" = import ./home.nix;
    };
  };
}
