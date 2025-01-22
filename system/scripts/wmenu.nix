{ pkgs }:

pkgs.writeShellApplication {
  name = "run-wmenu";
  text = "wmenu-run -if 'JetBrainsMonoNF 12' -p '[Wmenu]' -N 282828 -n ebdbb2 -M 689d6a -m 282828 -S 689d6a -s 282828";
}
# Color flags:
# -N: normal bg color
# -n: normal fg color
# -M: prompt bg color
# -m: prompt fg color
# -S: selection bg color
# -s: selection fg color
