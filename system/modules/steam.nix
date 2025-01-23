{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  programs.gamemode.enable = true;
  environment.systemPackages = [ pkgs.mangohud ];
}
