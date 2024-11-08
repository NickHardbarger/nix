{ pkgs, ... }:
let
  version = "6.6.59-custom";
  modDirVersion = "6.6.59";
  src = fetchTarball {
    url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.59.tar.xz";
    sha256 = "0vd76ccd4li4wsg04gc4nai9f4y1nknz967qby0i53y0v046hq93";
  };
  configfile = ./.config;
in {
  linux = pkgs.linuxManualConfig {
    inherit version modDirVersion src configfile;
    allowImportFromDerivation = true;
  };
}