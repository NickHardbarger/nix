{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  services.xserver = {
    enable = true;
    autorun = false;
    xkb = {
      layout = "us";
      variant = "";
      options = "ctrl:nocaps";
    };
    excludePackages = with pkgs; [
      xterm
    ];
    displayManager = {
      startx.enable = false;
      lightdm.enable = false;
    };
  };
}
