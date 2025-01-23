{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      #~/nil/system/scripts/fetch.pl
      ~/nil/system/scripts/fetch.sh
    '';
    profileExtra = ''
      ~/nil/system/bin/slstatus -s | ~/nil/system/bin/dwl
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
