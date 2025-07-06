{
  config,
  pkgs,
  inputs,
  lib,
  myUser,
  ...
}:
{
  security = {
    sudo.enable = true; # TODO: figure out nix repo ownership issue
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "${myUser}" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
}
