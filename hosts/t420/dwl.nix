{ config, pkgs, ...}:
#with import <nixpkgs> {};

pkgs.writeShellScriptBin "dwlinit" ''
  /home/iglu/dwl/dwl
''