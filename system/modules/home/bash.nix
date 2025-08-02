{ config, pkgs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      nixfetch

      export PS1="\[\e[1;34m\]\w \[\e[91m\]\]($(git branch --show-current 2>/dev/null)) \[\e[0m\]󰘧 "
    '';
    profileExtra = ''
      startwl
    '';
  };
  home.shellAliases = {
    "l" = "ls -Alh --color=auto --group-directories-first";
    "screenshot" = "slurp | grim -g -"; # to use: screenshot <screenshot>.png
  };

}
