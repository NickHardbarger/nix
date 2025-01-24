{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
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
