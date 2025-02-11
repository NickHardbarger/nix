{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.nh = {
    enable = true;
    flake = "/home/nickh/nix";
    clean = {
      enable = true;
      #dates = weekly; # doesn't work??
      extraArgs = "--keep 3 --keep-since 3d";
    };
  };
}
