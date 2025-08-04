{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "run-wmenu" ''
      ${pkgs.dmenu-wayland}/bin/dmenu-wl_run -fn 'JetBrainsMonoNF 12'
    '')
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    speedtest-cli # test network speed
    wget # file retriever
    vlc # media player
  ];
}
