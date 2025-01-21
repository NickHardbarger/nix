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
  nixpkgs.config = {
    #allowBroken = true;
    allowUnfree = true;
  };
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "daily";
    randomizedDelaySec = "45min";
  };
}
