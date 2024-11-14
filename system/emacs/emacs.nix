{ pkgs }:

pkgs.writeShellApplication {
  name = "vim";
  text = "emacsclient -c -a ''";
}
