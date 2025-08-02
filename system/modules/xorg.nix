{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  services.xserver = {
    # Unfortunate necessity
    enable = true;
    autorun = false;
    excludePackages = with pkgs; [
      # Could probably remove more
      xorg.xrandr
      xorg.xset
      xorg.xsetroot
      xterm
    ];
    displayManager = {
      startx.enable = false;
      lightdm.enable = false;
    };
  };
}
