{ pkgs }:

pkgs.writeShellApplication {
  name = "vi";
  text = "emacsclient -c -a ''";
}
