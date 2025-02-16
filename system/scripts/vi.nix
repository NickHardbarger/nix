{ pkgs }:

pkgs.writeShellApplication {
  name = "vi";
  text = "exec emacsclient -c -a ''";
  # "exec emacsclient -c -a 'emacs'" doesn't run emacs daemon
}
