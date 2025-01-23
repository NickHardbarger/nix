{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
    # settings and extraConfig options don't work at all
  };
}
