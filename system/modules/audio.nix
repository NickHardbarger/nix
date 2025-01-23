{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  services = {
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      #jack.enable = true;
      #media-session.enable = true;
    };
  };
}
