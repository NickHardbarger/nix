{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  services.scx = {
    enable = false;
    package = pkgs.scx.full; # TODO: figure out package
    scheduler = "scx_rustland"; # TODO: figure out scheduler
    #extraArgs = [ "--slice-us 5000" "--verbose" ]; # TODO: figure out args
  };
}
