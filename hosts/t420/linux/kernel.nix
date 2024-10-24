{ pkgs, ... }: {
  boot.kernelPackages = pkgs.linuxManualConfig {
    version = "6.11.5-nil";
    modDirVersion = "6.11.5";
    src = pkgs.fetchurl {
      url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.11.5.tar.xz"; #${modDirVersion}.tar.xz";
      hash = "sha256:01rafnqal2v96dzkabz0irymq4sc9ja00ggyv1xn7yzjnyrqa527";
    };
    configfile = ./.config;
    #linux = pkgs.linuxManualConfig {
    #  inherit version modDirVersion src configfile;
    #  allowImportFromDerivation = true;
    #};
  };
}
