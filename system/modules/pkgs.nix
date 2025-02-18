{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wmenu # app launcher
    (import ../scripts/wmenu.nix { inherit pkgs; })
    (import ../scripts/start.nix { inherit pkgs; })
    #wbg # wallpaper setter #!!build failure
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    speedtest-cli # test network speed
    wget # file retriever
    libreoffice # office suite
  ];
}
