{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      ~/nix/system/scripts/fetsh
    '';
    profileExtra = ''
      start
    '';
  };
  home.shellAliases = {
    "cmatrix" = "cmatrix -C cyan";
    ".." = "cd ..";
    "screenshot" = "slurp | grim -g -"; # to use: screenshot <screenshot>.png
  };

}
