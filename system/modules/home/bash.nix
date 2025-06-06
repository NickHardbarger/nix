{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      ~/nix/system/scripts/fetsh
    '';
    profileExtra = ''
      startwl
    '';
  };
  home.shellAliases = {
    # "cmatrix" = "cmatrix -C cyan";
    # ".." = "cd ..";
    "l" = "ls -Alh --color=auto --group-directories-first";
    "screenshot" = "slurp | grim -g -"; # to use: screenshot <screenshot>.png
  };

}
