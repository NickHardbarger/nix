{ pkgs }:

pkgs.writeShellApplication {
  name = "vscode";
  text = ''
    emacsclient -c -a '\'
  '';
}
