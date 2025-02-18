{ pkgs }:

pkgs.writeShellApplication {
  name = "start";
  runtimeInputs = [ pkgs.wlroots_0_18 ];
  text = ''
    /home/nickh/nix/system/bin/slstatus -s | /home/nickh/nix/system/bin/dwl
    exec <&-
  '';
}
