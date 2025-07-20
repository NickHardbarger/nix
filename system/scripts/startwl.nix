{ pkgs }:

pkgs.writeShellApplication {
  name = "startwl";
  text = ''
    wlstat | dwl -s 'swaybg -i ~/nix/system/wallpapers/columbus.jpg <&-'
  '';
}
