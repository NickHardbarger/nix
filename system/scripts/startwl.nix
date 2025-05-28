{ pkgs }:

pkgs.writeShellApplication {
  name = "startwl";
  text = ''
    /home/nickh/nix/system/bin/wlstat | dwl
    exec <&-
  '';
}
