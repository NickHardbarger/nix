{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    # configures nix to build with all cores
    cores = 0;
    max-jobs = "auto";
  };
}
