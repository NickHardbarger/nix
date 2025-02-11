{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      #~/nix/system/scripts/fetch.pl
      ~/nix/system/scripts/fetsh
    '';
    profileExtra = ''
      ~/nix/system/bin/slstatus -s | ~/nix/system/bin/dwl
      exec <&-
    '';
    # launches dwl on login, then flushes path? i think
  };
  home.shellAliases = {
    "cmatrix" = "cmatrix -C cyan";
    ".." = "cd ..";
    "screenshot" = "slurp | grim -g -"; # to use: screenshot <screenshot>.png
  };

}
