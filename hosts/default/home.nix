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
      bashrcExtra = "pfetch";
    };
    emacs = {
      enable = true;
    };
  };
  home.shellAliases = {
    "irs" = "sudo nixos-rebuild switch --flake ~/nicksOS#default";
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
      enable = true;
      startWithUserSession = true;
      #package = pkgs.emacs;
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
    enable = true; # might not need this line
    configFile = {
      "sway/config".source = ./sway/config;
      "i3status/config".source = ./i3status/config;
      "tofi/config".source = ./tofi/config;
    };
  };
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
