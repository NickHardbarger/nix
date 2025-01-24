{ pkgs }:

pkgs.writeShellApplication {
  name = "vi";
  text = "exec emacsclient -c -a 'emacs'";
}
