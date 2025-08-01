{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  boot = {
    loader = {
      grub.enable = false;
      systemd-boot = {
        enable = true;
        configurationLimit = 15;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    consoleLogLevel = 0;
    initrd = {
      verbose = false;
      # Unnecessary with NetworkManager
      systemd.network.wait-online.enable = false;
    };
    #kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
  systemd.extraConfig = ''DefaultTimeoutStopSec=10s'';
}
