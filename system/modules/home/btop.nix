{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    extraConfig = ''
      color_theme = "gruvbox_dark"
      theme_background = True
    '';
  };
}
