{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "run-wmenu" ''
      ${pkgs.wmenu}/bin/wmenu-run -if 'JetBrainsMonoNF 12' -p '菜单' -N 282828 -n ebdbb2 -M d65d0e -m 282828 -S d65d0e -s 282828
    '')
    (import ../scripts/start.nix { inherit pkgs; })
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    speedtest-cli # test network speed
    wget # file retriever
    vlc # media player
  ];
}
