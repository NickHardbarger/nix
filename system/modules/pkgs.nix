{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "run-wmenu" ''
      ${pkgs.wmenu}/bin/wmenu-run -if 'JetBrainsMonoNF 12' -p '[Wmenu]' -N 282828 -n ebdbb2 -M 689d6a -m 282828 -S 689d6a -s 282828
    '')
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
