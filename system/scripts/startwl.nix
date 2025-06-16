{ pkgs }:

pkgs.writeShellApplication {
  name = "startwl";
  text = ''
    wlstat | dwl
    exec <&-
  '';
}
