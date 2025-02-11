{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  security = {
    sudo.enable = true; # TODO: figure out nix repo ownership issue
    doas = {
      enable = false;
      extraRules = [
        {
          users = [ "nickh" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
