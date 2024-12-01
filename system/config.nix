{
  config, # unneeded?
  pkgs,
  inputs,
  lib,
  ...
}:

{

  imports = [
    inputs.home-manager.nixosModules.default
    ./slstatus/slstatus.nix
  ];
  #SECURITY
  #SYSTEM
  #NIX
  #VIRTUALISATION
  #USERS
  #HOME-MANAGER
  #ENVIRONMENT
  #FONTS
  ### NIXPKGS ###
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
    hostPlatform = {
      #gcc.arch = "sandybridge";
      #gcc.tune = "sandybridge";
      system = "x86_64-linux";
    };
    overlays = [
      (final: prev: {
        slstatus = prev.slstatus.override {
          conf = ./slstatus/config.h;
        };
      })
      #(final: prev: {
      #dwl = prev.dwl.overrideAttrs (old: {
      #src = /home/nickh/mydwl;
      #});
      #})
    ];
  };
  ### BOOT ###
  boot = {
    loader = {
      grub.enable = false;
      systemd-boot = {
        enable = true;
        configurationLimit = 15;
      };
      efi.canTouchEfiVariables = true;
      timeout = 1;
    };
    plymouth = {
      enable = true;
      theme = "glitch";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "glitch" ];
        })
      ];
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelPackages = pkgs.linuxPackages_zen;
    #kernelPatches = [
    # TODO: figure out why configuration won't work
    #{
    #name = "nil";
    #patch = null;
    #structuredExtraConfig = with lib.kernel; {
    # compression algorithm
    #KERNEL_LZ4 = yes; # fastest, least compression
    #KERNEL_ZSTD = no; # won't let me change this for some reason
    # timer frequency- won't work
    #TICK_ONESHOT = no;
    #NO_HZ_COMMON = no;
    #HZ_PERIODIC = yes; # more power usage, better performance
    #NO_HZ_IDLE = no;
    #NO_HZ = no;
    # cpu frequency
    #CPU_FREQ_DEFAULT_GOV_PERFORMANCE = yes;
    #CPU_FREQ_DEFAULT_GOV_POWERSAVE = no;
    #CPU_FREQ_DEFAULT_GOV_USERSPACE = no;
    #CPU_FREQ_DEFAULT_GOV_SCHEDUTIL = no;
    #CPU_FREQ_GOV_PERFORMANCE = yes;
    #CPU_FREQ_GOV_POWERSAVE = no;
    #CPU_FREQ_GOV_USERSPACE = no;
    #CPU_FREQ_GOV_ONDEMAND = no;
    #CPU_FREQ_GOV_CONSERVATIVE = no;
    #CPU_FREQ_GOV_SCHEDUTIL = no;
    # other cpu options
    #TASKSTATS = no;
    #X86_MPPARSE = no;
    #X86_EXTENDED_PLATFORM = no;
    #NR_CPUS = 32;
    #X86_MCE_INTEL = yes; # intel only
    #X86_MCE_AMD = no; # amd only
    #X86_5LEVEL = no;
    # cpu type
    #MK8 = no; # amd
    #MPSC = no; # older intel
    #MCORE_2 = yes; # intel core 2
    #MATOM = no; # intel atom
    #GENERIC_CPU = no;
    # modules
    #MODULES = no;
    # drivers
    #HAMRADIO = no;
    #MD = no; # raid/lvm
    #MACINTOSH_DRIVERS = no;
    #INPUT_TABLET = no;
    #INPUT_TOUCHSCREEN = no;
    #};
    #}
    #];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };
  ### NETWORKING ###
  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        80
        443
      ];
      #allowedUDPPortRanges = [
      #  { from = 4000; to = 4007; }
      #	 { from = 8000; to = 8010; }
      #];
    };
    proxy = {
      #default = "http://user:password@proxy:port/";
      #noProxy = "127.0.0.1,localhost,internal.domain";
    };
  };
  ### HARDWARE ###
  hardware = {
    pulseaudio.enable = false;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  ### LOCALE ###
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
  ### SYSTEMD ###
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';
  ### SERVICES ###
  services = {
    blueman.enable = true;
    printing.enable = true;
    ollama.enable = false;
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
    fail2ban = {
      enable = true;
      maxretry = 5;
      ignoreIP = [
        "10.0.0.0/8"
        "172.16.0.0/12"
        "192.168.0.0/16"
        "8.8.8.8"
      ];
      bantime = "24h";
      bantime-increment = {
        enable = true;
        multipliers = "1 2 4 8 16 32 64";
        maxtime = "168h";
        overalljails = true;
      };
    };
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = true;
        AllowUsers = [ "nickh" ];
        UseDns = true;
        X11Forwarding = false;
        PermitRootLogin = "prohibit-password";
      };
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
        lightdm = {
          enable = false;
        };
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
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "daily";
    randomizedDelaySec = "30min";
  };
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      system-features = [
        "benchmark"
        "big-parallel"
        "kvm"
        "nixos-test"
        "gccarch-sandybridge"
      ];
      # configures nix to build with all cores
      cores = 0;
      max-jobs = "auto";
    };
  };
  virtualisation = {
    virtualbox.host.enable = true;
  };
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
  ### PROGRAMS ###
  programs = {
    nix-ld.enable = true;
    bash.blesh.enable = true;
    nh = {
      enable = true;
      flake = "/home/nickh/nil";
      clean = {
        enable = true;
        #dates = weekly; # doesn't work??
        extraArgs = "--keep-since 3d --keep 3";
      };
    };
    ssh = {
      startAgent = true;
    };
    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisplayBookmarksToolbar = "always";
        ExtensionSettings =
          {
          };
        preferences =
          {
          };
      };
    };
    nano = {
      enable = false;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
    };
    foot = {
      enable = true;
      theme = "gruvbox-dark";
      settings = {
        main = {
          font = "JetBrainsMonoNF:size=12";
        };
        colors = {
          alpha = 0.9;
        };
        scrollback = {
          lines = 100000;
        };
      };
    };
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        line_break = {
          disabled = true;
        };
        format = "$all$directory$character";
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    ### DWL ###
    (import ./dwl/dwl.nix { inherit pkgs; })
    slstatus # provides input for bar
    wmenu # app launcher
    (import ./wmenu/wmenu.nix { inherit pkgs; })
    wbg # wallpaper setter
    mako # notification daemon
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
    onlyoffice-bin # office suite
    #onlyoffice-desktopeditors # office suite
  ];
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # best font
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
