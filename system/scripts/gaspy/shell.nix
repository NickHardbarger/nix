{
  pkgs ? import <nixpkgs> { },
}:

# Commands for running gaspy from outside of this directory:
# nix-shell -p python313Packages.selenium chromium chromedriver
# ~/nix/system/scripts/gaspy/gaspy

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [ selenium ]))
    # both are necessary for running headless chrome
    pkgs.chromium
    pkgs.chromedriver
  ];
}
