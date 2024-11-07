{ pkgs }:
#with import <nixpkgs> {};

pkgs.writeShellApplication {
  name = "mydwl";
  runtimeInputs = with pkgs; [ # might not be necessary
    wayland
    wayland-scanner
    wlroots
    libinput
    libxkbcommon
    pixman
    libdrm
    fcft
  ];
  text = ''
    exec slstatus -s | /home/iglu/mydwl/dwl
    exec <&-
  '';
}