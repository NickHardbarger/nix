{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  services.xserver.videoDrivers = [
    "intel"
    "amdgpu"
    "nvidia"
  ];
}
