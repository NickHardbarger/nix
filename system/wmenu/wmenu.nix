{ pkgs }:

pkgs.writeShellApplication {
  name = "run-wmenu";
  text = "wmenu-run -f 'Jetbrains Mono 12'";
}
