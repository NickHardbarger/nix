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
    excludePackages = with pkgs; [
      xterm
    ];
    displayManager = {
      startx.enable = false;
      lightdm.enable = false;
    };
  };
}
