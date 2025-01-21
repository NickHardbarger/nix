{
  config, # unneeded?
  pkgs,
  inputs,
  lib, # unneeded?
  ...
}:

{

  imports = [
    inputs.home-manager.nixosModules.default
    ./firefox.nix
    ./fail2ban.nix
    ./ssh.nix
    ./steam.nix
    ./foot.nix
    ./starship.nix
    ./nh.nix
    ./nix.nix
    ./boot.nix
    ./firewall.nix
    ./bluetooth.nix
  ];
  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  time.timeZone = "America/New_York";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };
  services = {
    scx = {
      enable = false;
      package = pkgs.scx.full; # TODO: figure out package
      scheduler = "scx_rustland"; # TODO: figure out scheduler
      #extraArgs = [ "--slice-us 5000" "--verbose" ]; # TODO: figure out args
    };
    printing.enable = true;
    ollama.enable = false;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
      #jack.enable = true;
      #media-session.enable = true;
    };
    xserver = {
      enable = true;
      autorun = false;
      xkb = {
        layout = "us";
        variant = "";
        options = "ctrl:nocaps";
      };
      videoDrivers = [
        #"amdgpu"
        "intel"
      ];
      excludePackages = with pkgs; [
        xterm
      ];
      displayManager = {
        startx.enable = false;
        lightdm.enable = false;
      };
    };
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.enable = true; # TODO: figure out nil repo ownership issue
    doas = {
      enable = false;
      extraRules = [
        {
          users = [ "nickh" ];
          keepEnv = true;
          persist = true;
        }
      ];
    };
  };
  virtualisation.virtualbox.host.enable = true;
  # Don't forget to set a password with ‘passwd’.
  users.users.nickh = {
    isNormalUser = true;
    description = "nickh";
    initialPassword = "1337";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "nickh" = import ./home.nix;
    };
  };
  programs = {
    nix-ld.enable = true;
    bash.blesh.enable = true;
    nano.enable = false;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    ### DWL ###
    (import ./dwl/dwl.nix { inherit pkgs; })
    wmenu # app launcher
    (import ./wmenu/wmenu.nix { inherit pkgs; })
    #wbg # wallpaper setter #!!build failure
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard

    ### CLI SCRIPTS ###
    speedtest-cli # test network speed
    cmatrix # matrix text scroll
    cowsay # generates ascii cow with message
    sl # steam locomotive on ls typo

    ### MISC ###
    (import ./emacs/emacs.nix { inherit pkgs; })
    #(import ./kernel/kernel.nix { inherit pkgs; })
    mangohud # steam hud overlay
    wget # file retriever
    pulseaudio # ?? I forget why that's there lol
    discord # chat client
    libreoffice # office suite
  ];
  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # old
    nerd-fonts.jetbrains-mono # new
  ];
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
