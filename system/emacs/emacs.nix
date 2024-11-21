{ pkgs }:

pkgs.writeShellApplication {
  name = "vim";
  text = "exec emacsclient -c -a 'emacs'";
}
