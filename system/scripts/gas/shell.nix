{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: with python-pkgs; [ selenium ]))
    # both are necessary for running headless chrome
    pkgs.chromium
    pkgs.chromedriver
  ];
}
