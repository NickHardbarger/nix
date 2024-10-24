{ config, pkgs, inputs, ... }:
{
  imports = [ 
      ./hardware.nix
      inputs.home-manager.nixosModules.default
      #./linux/kernel.nix
  ];
  #BOOT
  #NETWORKING
  #HARDWARE
  #SERVICES
  #TIME
  #I18N
  #NIXPKGS
  #SECURITY
  #SYSTEM
  #NIX
  #VIRTUALISATION
  #USERS
  #HOME-MANAGER
  #PROGRAMS
  #ENVIRONMENT
  #FONTS
  boot = {
    loader = {
      grub.enable = false;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    #kernelPackages = pkgs.linuxPackages;
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_hardened;
    #kernelPackages = pkgs.linuxPackages_zen;
    kernelPackages = pkgs.linuxManualConfig {
      version = "6.11.5";
      #modDirVersion = "6.11.5";
      src = pkgs.fetchurl {
        url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${version}.tar.xz";
	hash = "sha256:01rafnqal2v96dzkabz0irymq4sc9ja00ggyv1xn7yzjnyrqa527";
      };
      configfile = ./linux/.config;
    };
  };
  networking = {
    hostName = "nil";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
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
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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
  nixpkgs.config = {
    allowUnfree = true;
  };
  services = {
    fail2ban = {
      enable = true;
      maxretry = 5;
      ignoreIP = [
        "10.0.0.0/8" "172.16.0.0/12" "192.168.0.0/16"
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
        startx.enable = true;
        lightdm.enable = false;
      };
      windowManager = {
        dwm = {
          enable = true;
        };
        xmonad = {
          enable = true;
	  enableContribAndExtras = true;
        };
        qtile = {
          enable = true;
        };
      };
    };
  };
  services.printing.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
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
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
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
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    packages = with pkgs; [
    ];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "iglu" = import ./home.nix;
    };
  };
  ### PROGRAMS ###
  programs = {
    ssh = {
      startAgent = true;
    };
    sway = {
      enable = true;
      extraPackages = with pkgs; [
	waybar # statusbar
	swaybg # wallpaper setter
      ];
    };
    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];
      policies = {
        DisableTelemetry = true;
	DisableFirefoxStudies = true;
	DisablePocket = true;
	DisplayBookmarksToolbar = "always";
	ExtensionSettings = {
	};
	preferences = {
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
  hardware.graphics = {
    # radv driver: better performance but less "correct"
    enable = true;
    enable32Bit = true;

    # amdvlk driver: worse performance but more "correct", also the default for steam
    #extraPackages = [ pkgs.amdvlk ];
    #extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
  environment.variables = {
  };
  environment.systemPackages = with pkgs; [
    ### SIMPLE TERMINAL ###
    (st.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ ];
      patches = [
        ./st/st-defaultfontsize-20210225-4ef0cbd.diff
	./st/st-gruvbox-dark-0.8.5.diff
	#./st/st-themed_cursor-0.8.1.diff # patch error
	./st/st-scrollback-0.9.2.diff
	./st/st-scrollback-mouse-0.9.2.diff
	#./st/st-clickurl-0.8.5.diff # patch error
      ];
    }))
    ### DMENU ###
    (dmenu.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ ];
      patches = [
        ./dmenu/dmenu-gruvbox-20210329-9ae8ea5.diff
	./dmenu/dmenu-lineheight-5.2.diff
	./dmenu/dmenu-numbers-20220512-28fb3e2.diff
      ];
    }))
    dunst # notification daemon
    mangohud # steam hud overlay
    grim # screenshots
    slurp # screenshots
    wget # file retriever
    mako # notification daemon
    wl-clipboard # clipboard
    pulseaudio
    discord
    libreoffice
    onlyoffice-bin#desktopeditors
    ### CLI SCRIPTS ###
    pfetch-rs # basic system info
    cmatrix # matrix text scroll
    speedtest-cli # test network speed
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
