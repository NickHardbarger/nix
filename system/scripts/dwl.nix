{ pkgs }:

pkgs.writeShellApplication {
  name = "dwl";
  runtimeInputs = with pkgs; [
    # might not be necessary
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
    ~/nil/system/bin/slstatus -s | ~/nil/system/bin/dwl
    exec <&-
  '';
}
