{ pkgs }:

pkgs.writeShellApplication {
  name = "start";
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
    /home/nickh/nix/system/bin/slstatus -s | /home/nickh/nix/system/bin/dwl
    exec <&-
  '';
}
