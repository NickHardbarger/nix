{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wmenu # app launcher
    (import ../scripts/wmenu.nix { inherit pkgs; })
    #wbg # wallpaper setter #!!build failure
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    speedtest-cli # test network speed
    (import ../scripts/vi.nix { inherit pkgs; })
    wget # file retriever
    libreoffice # office suite
  ];
}
