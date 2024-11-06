{ pkgs }:
#with import <nixpkgs> {};

pkgs.writeShellScriptBin "dwlinit" ''
  /home/iglu/mydwl/dwl
''
pkgs.writeShellApplication {
  name = "dwlstart";
  runtimeInputs = with pkgs; [
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
    /home/iglu/mydwl/dwl
  '';
}