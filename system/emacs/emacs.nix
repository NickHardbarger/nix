{ pkgs }:

pkgs.writeShellApplication {
  name = "vscode";
  text = "exec emacsclient -c -a ''";
}
