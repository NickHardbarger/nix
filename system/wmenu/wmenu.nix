{ pkgs }:

pkgs.writeShellApplication {
  name = "run-wmenu";
  text = "wmenu-run -if 'JetBrainsMonoNF 12' -p '[Wmenu]'";
}
# Flags:
# -N: normal bg color
# -n: normal fg color
# -M: prompt bg color
# -m: prompt fg color
# -S: selection bg color
# -s: selection fg color
