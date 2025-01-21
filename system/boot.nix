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
    plymouth = {
      enable = true;
      theme = "glitch";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "glitch" ];
        })
      ];
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    systemd.extraConfig = ''DefaultTimeoutStopSec=10s'';
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
}
