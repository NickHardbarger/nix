{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "run-wmenu" ''
      ${pkgs.wmenu}/bin/wmenu-run -bif 'JetBrainsMonoNF 12' -p '菜单' -N 282828 -n fe8019 -M 83a598 -m 282828 -S 83a598 -s 282828
    '')
    (import ../scripts/startwl.nix { inherit pkgs; })
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    speedtest-cli # test network speed
    wget # file retriever
    vlce # media player

    # Test: this might be necessary for running dwl as a binary.
    # I think the problem is that wlroots keeps getting garbage collected away.
    wlroots
  ];
}
