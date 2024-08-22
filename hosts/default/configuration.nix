{ config, pkgs, inputs, ... }:
{
  imports = [ 
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
      inputs.nixvim.nixosModules.nixvim
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
  #USERS
  #HOME-MANAGER
  #PROGRAMS
  #ENVIRONMENT
  #FONTS
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot = {
    kernelPatches = [ {
      name = "envy-sound";
      patch = ./envy-sound.diff;
    } ];
    kernelPackages = pkgs.linuxPackages_6_1;
    #kernelPackages = pkgs.linuxPackages;
    #kernelPackages = pkgs.linuxPackages_latest;
    #kernelPackages = pkgs.linuxPackages_hardened;
    #kernelPackages = pkgs.linuxPackages_zen;
  };
  networking.hostName = "nicksOS";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  networking.networkmanager.enable = true;
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
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
    videoDrivers = [
      "amdgpu"
    ];
    excludePackages = with pkgs; [
      xterm
    ];
    displayManager.lightdm.enable = false; # display managers are more trouble than they're worth
    windowManager = {
      dwm = {
        enable = true;
      };
      awesome = {
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
  # Don't forget to set a password with ‘passwd’.
  users.users.iglu = {
    isNormalUser = true;
    description = "iglu";
    extraGroups = [ "networkmanager" "wheel" ];
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
  ### SWAY ###
    sway = {
      enable = true;
      extraPackages = with pkgs; [
        i3status # status bar
	dunst # notification daemon
	tofi # app launcher
      ];
    };
    ### FIREFOX ###
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
    ### VIM ###
    nano = {
      enable = false;
    };
    nixvim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      colorschemes.gruvbox.enable = true;
      extraConfigLua = ''
        vim.o.number = true
	vim.o.relativenumber = true
	vim.opt.guicursor = ""
	vim.opt.wrap = false
	vim.opt.hlsearch = false
	vim.opt.incsearch = true
	vim.opt.termguicolors = true
	vim.opt.colorcolumn = "80"
      '';
      plugins = {
        lualine.enable = true;
	fzf-lua.enable = true;
	fugitive.enable = true;
	telescope.enable = true;
	treesitter = {
	  enable = true;
	  grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars;
	};
	lsp = {
	  enable = true;
	  servers = {
	    nixd.enable = true;
	    bashls.enable = true;
	  };
	};
      };
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode = {
      enable = true;
    };
    ### SHELL ###
    bash = {
      shellAliases = {
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
  hardware.graphics = {
    # radv driver: better performance but less "correct"
    enable = true;
    enable32Bit = true;

    # amdvlk driver: worse performance but more "correct", also the default for steam
    extraPackages = [ pkgs.amdvlk ];
    extraPackages32 = [ pkgs.driversi686Linux.amdvlk ];
  };
  environment.variables = {
  };
  environment.systemPackages = with pkgs; [
    ### SIMPLE TERMINAL ###
    (st.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ /*xorg.libXcursor*/ ];
      patches = [
        (fetchpatch { # gruvbox colorscheme
	  url = "https://st.suckless.org/patches/gruvbox/st-gruvbox-dark-0.8.5.diff";
	  sha256 = "0jvn0i0fl0w3c8dcmwyh9w19g3hsi22cqmyqly5zjzjwjhc8qnjv";
	})
	(fetchpatch { # adds janky scrolling: shift + pgup/pgdn
	  url = "https://st.suckless.org/patches/scrollback/st-scrollback-0.9.2.diff";
	  sha256 = "0ymc5db75cwmdvv8ak3bfaf7iz4snj65fbmhrl9blv7h7pw3pdld";
	})
	(fetchpatch { # improves the scrolling, now just need shift + mousewheel
	  url = "https://st.suckless.org/patches/scrollback/st-scrollback-mouse-0.9.2.diff";
	  sha256 = "068s5rjvvw2174y34i5xxvpw4jvjy58akd1kgf025h1153hmf7jy";
	})
	(fetchpatch { # allows setting default font size
	  url = "https://st.suckless.org/patches/defaultfontsize/st-defaultfontsize-20210225-4ef0cbd.diff";
	  sha256 = "0jji1p096zpkyxg7cmxhj4mgvwg582xgl1xw7lfkirxdxf1lp70m";
	})
	#(fetchpatch { # lets cursor access my cursor theme
	#  url = "https://st.suckless.org/patches/themed_cursor/st-themed_cursor-0.8.1.diff";
	#  sha256 = "1h22jfcwc1pskw0vf107sv29rnwqqp5vbbz2dg8acd9xwhmhhyb2";
	#})
	#(fetchpatch { # lets me click on links
	#  url = "https://st.suckless.org/patches/clickurl/st-clickurl-0.8.5.diff";
	#  sha256 = "1a97q2hv63j2nq6vw924a6si8wg4903rbkrmml31zlhjgl9nbmq4";
	#})
      ];
    }))
    ### DMENU ###
    (dmenu.overrideAttrs (oldAttrs: {
      buildInputs = oldAttrs.buildInputs ++ [ ];
      patches = [
        (fetchpatch { # gruvbox colorscheme
	  url = "https://tools.suckless.org/dmenu/patches/gruvbox/dmenu-gruvbox-20210329-9ae8ea5.diff";
	  sha256 = "1fblgsxh86rgbl25n1qbkz5gfndvkv20hyzfiy068n5hih2mvmp6";
	})
      ];
    }))
    mangohud # steam hud overlay
    grim # screenshots
    slurp # screenshots
    pfetch-rs # fetch script
    wget # file retriever
    mako # notification daemon
    wl-clipboard # clipboard
    cmatrix # fun cli script
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
  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
