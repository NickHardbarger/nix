{ config, pkgs, ... }:

{
  # DO NOT FUCK WITH THIS UNTIL BACKED UP WITH GIT
  home.username = "iglu";
  home.homeDirectory = "/home/iglu";
  ### PROGRAMS ###
  programs = {
    ### GIT ###
    git = {
      enable = true;
      userName = "Nick";
      userEmail = "nickhardbarger13@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/iglu/nicksOS";
      };
    };
    bash = {
      enable = true;
      bashrcExtra = ''
        pfetch
      '';
    };
    emacs = {
      enable = true;
      package = pkgs.emacs-nox;
    };
  };
  home.shellAliases = {
    "irs" = "sudo nixos-rebuild switch --flake ~/nicksOS#default";
    "cough" = "sudoedit ~/nicksOS/hosts/default/configuration.nix";
    "horse" = "sudoedit ~/nicksOS/hosts/default/home.nix";
    "sack" = "sudo git add * && sudo git commit -m";
    "qstart" = "qtile start -b wayland";
    "cmatrix" = "cmatrix -C cyan";
    ".." = "cd ..";
  };
  ### CURSOR ###
  home.pointerCursor = {
    name = "Simp1e-Gruvbox-Dark";
    package = pkgs.simp1e-cursors;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Simp1e-Gruvbox-Dark";
    };
    gtk = {
      enable = true;
    };
  };
  services = {
    emacs = {
      enable = true; # enables emacs daemon mode
      startWithUserSession = true;
      defaultEditor = true;
      package = pkgs.emacs-nox;
      client = {
        arguments = [
	  "-c"
	];
      };
    };
  };
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  home.file = {
  };
  xdg = {
    enable = true;
    configFile = {
      "qtile/config.py".source = ./qtile/config.py;
      "sway/config".source = ./sway/config;
      "i3status/config".source = ./i3status/config;
      "waybar/config.jsonc".source = ./waybar/config.jsonc;
      "waybar/style.css".source = ./waybar/style.css;
      "tofi/config".source = ./tofi/config;
    };
  };
  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}