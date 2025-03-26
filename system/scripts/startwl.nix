{ pkgs }:

pkgs.writeShellApplication {
  name = "startwl";
  runtimeInputs = with pkgs; [
    libinput
    wayland
    wlroots
    libxkbcommon
    xorg.libxcb
    xorg.xcbutilwm
    xwayland
  ];
  text = ''
    /home/nickh/nix/system/bin/wlstat | /home/nickh/nix/system/bin/dwl
    exec <&-
  '';
}
