{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    extraConfig = ''
      color_theme = "Default"
      theme_background = True
    '';
  };
}
