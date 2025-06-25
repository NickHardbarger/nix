{
  config,
  pkgs,
  inputs,
  ...
}:
let
  # To get new hash, run:
  # nix-prefetch-github NickHardbarger <repo> | grep hash | awk '{print $2}' | wl-copy

  dwlsrc = pkgs.fetchFromGitHub {
    owner = "NickHardbarger";
    repo = "dwl-v0.7";
    rev = "main";
    hash = "sha256-uEZaQUk8pVUpc4G7N5FdECydDkHAWCi7/EIgOp/s0mI=";
  };

  cattysrc = pkgs.fetchFromGitHub {
    owner = "NickHardbarger";
    repo = "catty";
    rev = "main";
    hash = "sha256-P/hIrhfNeFEKaRe5GAVSy/2pX+4PFVmUZ2mtF/IOT3I=";
  };

  slstatussrc = pkgs.fetchFromGitHub {
    owner = "NickHardbarger";
    repo = "slstatus";
    rev = "main";
    hash = "sha256-THA55nT+D3m8ff1PnBxO1Kd5xT3laIt+EtDLK0Ag8RA=";
  };

in
{

  imports = [
    inputs.home-manager.nixosModules.default
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/direnv.nix
    ../../modules/doas.nix
    ../../modules/fail2ban.nix
    ../../modules/firewall.nix
    ../../modules/fonts.nix
    ../../modules/foot.nix
    ../../modules/games.nix
    ../../modules/locale.nix
    # ../../modules/minecraft.nix
    ../../modules/nh.nix
    ../../modules/nix.nix
    ../../modules/pkgs.nix
    ../../modules/scx.nix
    ../../modules/ssh.nix
    ../../modules/starship.nix
    ../../modules/upgrades.nix
    ../../modules/users.nix
    ../../modules/xkb.nix
    ../../modules/xorg.nix
  ];
  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };

  boot = {
    kernelParams = [
      "i915.enable_rc6=7"
      "video=LVDS-1:1600x900@60"
    ];
    kernelModules = [ "tp_smapi" ];
    extraModulePackages = with config.boot.kernelPackages; [ tp_smapi ];
    # "Module intel not found"
    #initrd.kernelModules = [ "intel" ]; # early KMS
  };
  hardware = {
    enableAllHardware = false;
    enableAllFirmware = true;
    cpu.intel.updateMicrocode = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = [
        pkgs.intel-vaapi-driver
      ];
      extraPackages32 = [
        pkgs.pkgsi686Linux.intel-vaapi-driver # wiki says this
        #pkgs.driversi686Linux.intel-vaapi-driver # but pkg name is this?
      ];
    };
    trackpoint = {
      enable = true;
      emulateWheel = true;
    };
  };
  services.xserver.videoDrivers = [ "intel" ];

  services = {
    printing.enable = true;
    ollama.enable = false;
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  virtualisation.virtualbox.host.enable = true;
  programs = {
    nix-ld.enable = true;
    bash.blesh.enable = true;
    nano.enable = false;
  };

  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [
      cmatrix # matrix text scroll
      cowsay # generates ascii cow with message
      sl # steam locomotive on ls typo
      discord # chat client

      nix-prefetch-github
      (pkgs.callPackage "${dwlsrc}/build.nix" { })
      (pkgs.callPackage "${cattysrc}/build.nix" { })
      (pkgs.callPackage "${slstatussrc}/build.nix" { })
    ];
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
