{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    extraConfig = ''
      theme_background = False
    '';
  };
}
