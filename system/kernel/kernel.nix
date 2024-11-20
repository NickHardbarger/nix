{ pkgs, ... }:
let
  version = "6.12-custom";
  modDirVersion = "6.12";
  src = pkgs.fetchurl {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.12.tar.xz";
    hash = "sha256:1sr58vsh39hdwk0z27lg14isqwn4g8m4r7a8z2rsyhkfwlmmd8mi";
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
