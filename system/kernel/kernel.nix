{ pkgs, ... }:
let
  version = "6.6.61-custom";
  modDirVersion = "6.6.61";
  src = pkgs.fetchurl {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.61.tar.xz";
    hash = "sha256:02vw0jphzqj8cd5apf8wbjp2wahwcnvw6vchv4z1q3qrz56w53s1";
  };
  configfile = ./.config;
in
{
  myLinux = pkgs.linuxManualConfig {
    inherit
      version
      modDirVersion
      src
      configfile
      ;
    allowImportFromDerivation = true;
  };
}
