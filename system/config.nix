{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

{

  imports = [
    inputs.home-manager.nixosModules.default
    ./slstatus/slstatus.nix
    #./kernel/kernel.nix
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
    overlays = [
      (final: prev: {
        slstatus = prev.slstatus.override {
          conf = ./slstatus/config.h;
        };
      })
      (final: prev: {
      dwl = prev.dwl.overrideAttrs (old: {src = /home/iglu/mydwl;});
    })
    ];
  };
  ### BOOT ###
  boot = {
    loader = {
      grub.enable = false;
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };
    ### KERNEL ###
    #kernelPackages = pkgs.linuxPackagesFor linux;
    kernelPackages = pkgs.linuxPackages_zen;
    #kernelPackages = pkgs.linuxManualConfig {
    #version = "6.6.59";
    #src = fetchTarball {
    #url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.6.59.tar.xz";
    #sha256 = "0vd76ccd4li4wsg04gc4nai9f4y1nknz967qby0i53y0v046hq93";
    #};
    #configfile = ./kernel/.config;
    #stdenv = pkgs.gcc10Stdenv;
    #extraMakeFlags = ["WERROR=0"];
  };
  #kernelPatches = lib.singleton {
  #name = "nil";
  #patch = null;
  #extraStructuredConfig = with lib.kernel; {
  #KERNEL_ZSTD = yes;
  #CC_OPTIMIZE_FOR_PERFORMANCE = yes;
  #MCORE2 = yes; # intel
  #MK8 = no; # amd
  #GENERIC_CPU = no; # generic
  #POSIX_MQUEUE = yes; # changed to yes to fix error
  #USELIB = no;
  ##AUDIT = no;
  #PREEMPT = no; # low latency # changed to no to fix error
  #PREEMPT_VOLUNTARY = yes; # balanced # changed to yes to fix error
  #PREEMPT_NONE = no; # low throughput
  #IKCONFIG = yes;
  #IKCONFIG_PROC = yes;
  #BLK_DEV_INITRD = yes; # initramfs/initrd # changed to yes to fix error
  #PROFILING = no;
  #X86_MPPARSE = no;
  #X86_EXTENDED_PLATFORM = no;
  ##NR_CPUS = "32"; # num of cores, also this didn't work, as I expected
  #X86_5LEVEL = no;
  #NUMA = yes; # changed to yes to fix error
  #X86_CHECK_BIOS_CORRUPTION = yes; # changed to yes to fix error
  #EFI_STUB = yes; # changed to yes to fix error
  #SUSPEND = no;
  #HIBERNATION = no;
  #PM_DEBUG = no;
  #PM_ADVANCED_DEBUG = yes; # changed to yes to fix error
  #PM_TRACE = yes; # changed to yes to fix error
  #PM_TRACE_RTC = yes; # changed to yes to fix error
  #ACPI_SPCR_TABLE = no;
  ##CPU_FREQ_DEFAULT_GOV_PERFORMANCE = yes;
  #X86_ACPI_CPUFREQ = no;
  #INTEL_IDLE = yes;
  #VIRTUALIZATION = no;
  #KPROBES = yes; # changed to yes to fix error
  #GCC_PLUGINS = no;
  #MODULES = yes;
  #MODULES = no; # may lead to stuff not working!
  #BLK_DEBUG_FS = no;
  #MQ_IOSCHED_DEADLINE = yes; # changed to yes to fix error
  #MQ_IOSCHED_KYBER = yes; #no;
  #MQ_IOSCHED_BFQ = no;
  #IOSCHED_BFQ = module; # changed to module to fix error
  #SWAP = yes;
  #ZSWAP = yes;
  #ZSWAP_DEFAULT_ON = yes;
  #ZSWAP_EXCLUSIVE_LOADS_DEFAULT_ON = yes;
  #ZSWAP_COMPRESSOR_DEFAULT_ZSTD = yes;
  #ZSWAP_ZPOOL_DEFAULT_ZBUD = yes;
  #TRANSPARENT_HUGEPAGE = yes;
  #TRANSPARENT_HUGEPAGE_ALWAYS = no; # changed to no to fix error
  #IP_ADVANCED_ROUTER = yes; # changed to yes to fix error
  #IP_PNP = no;
  ##SYN_COOKIES = no;
  #TCP_CONG_ADVANCED = yes; # changed to yes to fix error
  #TCP_MD5SIG = no;
  #IPV6 = yes;
  #NETLABEL = no;
  #NET_SCHED = yes; # changed to yes to fix error
  #HAMRADIO = no;
  #BT = no;
  #NET_9P = no;
  #HOTPLUG_PCI = no;
  #DEBUG_DEVRES = no;
  #BLK_DEV_NVME = yes;
  #SATA_PMP = no;
  #ATA_SFF = no;
  #MD = yes; # changed to yes to fix error
  #MACINTOSH_DRIVERS = no;
  #INPUT_TABLET = no;
  #INPUT_TOUCHSCREEN = no;
  #INPUT_MISC = no;
  #SERIAL_8250 = yes; # changed to yes to fix error
  #SERIAL_NONSTANDARD = no;
  #HW_RANDOM = no;
  #WATCHDOG = no;
  #WATCHDOG_SYSFS = yes; # changed to yes to fix error
  #AGP = yes; # changed to yes to fix error
  #DRM_AMDGPU = yes;
  #DRM_I915 = yes;
  #DRM_I915_GVT = yes;
  #DRM_I915_GVT_KVMGT = module; # changed to module to fix error
  #X86_SGX_KVM = yes;
  #KVM_AMD_SEV = yes;
  #KVM_ASYNC_PF = yes;
  #KVM_GENERIC_DIRTYLOG_READ_PROTECT = yes;
  #KVM_MMIO = yes;
  #KVM_VFIO = yes;
  #SND_SUPPORT_OLD_API = no;
  #SND_VERBOSE_PROCFS = no;
  #HID_A4TECH = no;
  #HID_BELKIN = no;
  #HID_CHERRY = no;
  #HID_CHICONY = no;
  #HID_CYPRESS =  no;
  #HID_EZKEY = no;
  #HID_GYRATION = no;
  #HID_ITE = no;
  #HID_KENSINGTON = no;
  #HID_REDRAGON = no;
  #HID_MICROSOFT = no;
  #HID_MONTEREY = no;
  #HID_NTRIG = no;
  #HID_PANTHERLORD = no;
  #HID_PETALYNX = no;
  #HID_SAMSUNG = no;
  #HID_SUNPLUS = no;
  #HID_TOPSEED = no;
  #USB_OHCI_HCD = no;
  #USB_UHCI_HCD = no;
  #QUOTA = no;
  #AUTOFS_FS = no;
  #EFIVAR_FS = yes;
  #SECURITY_SELINUX = no;
  #DEBUG_KERNEL = yes;
  #FTRACE = yes; # changed to yes to fix error
  #PROVIDE_OHCI1394_DMA_INIT = no;
  #};
  #};
  #};
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
  ### SERVICES ###
  services = {
    blueman.enable = true;
    printing.enable = true;
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
        AllowUsers = [ "iglu" ];
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
        "amdgpu"
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
    };
  };
  virtualisation = {
    virtualbox.host.enable = true;
  };
  # Don't forget to set a password with ‘passwd’.
  users.users.iglu = {
    isNormalUser = true;
    description = "iglu";
    initialPassword = "iglu";
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
      "iglu" = import ./home.nix;
    };
  };
  ### PROGRAMS ###
  programs = {
    nix-ld.enable = true;
    bash.blesh.enable = true;
    nh = {
      enable = true;
      flake = "/home/iglu/nil";
      clean = {
        enable = true;
        #dates = weekly; # doesn't work??
        extraArgs = "--keep-since 3d --keep 3";
      };
    };
    ssh = {
      startAgent = true;
    };
    sway = {
      enable = true;
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
  environment.systemPackages = with pkgs; [
    ### DMENU ###
    (dmenu.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ ];
      patches = [
        ./dmenu/dmenu-gruvbox-20210329-9ae8ea5.diff
        ./dmenu/dmenu-lineheight-5.2.diff
        ./dmenu/dmenu-numbers-20220512-28fb3e2.diff
      ];
    }))
    ### DWL ###
    (import ./dwl/dwl.nix { inherit pkgs; })
    slstatus # provides input for bar
    wmenu # app launcher
    foot # terminal
    wbg # wallpaper setter
    mako # notification daemon
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard
    ### CLI SCRIPTS ###
    pfetch-rs # basic system info
    cmatrix # matrix text scroll
    speedtest-cli # test network speed
    ### LSP ###
    nixd
    nixfmt-rfc-style
    ### MISC ###
    waybar # statusbar
    mangohud # steam hud overlay
    wget # file retriever
    pulseaudio # ?? I forget why that's there lol
    discord # chat client
    libreoffice # office suite
    onlyoffice-bin # office suite
    #onlyoffice-desktopeditors # office suite
  ];
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # installs only that font
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
