{ config, pkgs, ... }:
{
  home = {
    username = "iglu";
    homeDirectory = "/home/iglu";
  };
  ### PROGRAMS ###
  programs = {
    home-manager = {
      enable = true;
    };
    ### GIT ###
    git = {
      enable = true;
      userName = "Nick";
      userEmail = "nickhardbarger13@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        safe.directory = "/home/iglu/nil";
      };
    };
    btop = {
      enable = true;
      package = pkgs.btop;
      #settings = { color_theme = "gruvbox_dark"; };
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
      extraPackages = epkgs: [
        epkgs.gruvbox-theme # colorscheme
        epkgs.tree-sitter # syntax highlighting
        epkgs.tree-sitter-langs # better language support
        epkgs.rainbow-delimiters # rainbow parentheses
        epkgs.magit # git client
        epkgs.company # completion
        epkgs.neotree # directory viewer
        epkgs.nix-mode # nix major mode
        epkgs.lsp-mode # language server support
        epkgs.smartparens # insert pairs
        epkgs.hyperbole # hyperlinks
        epkgs.projectile # project navigation
      ];
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
      ];
    };
  };
  home.shellAliases = {
    "cmatrix" = "cmatrix -C cyan";
    ".." = "cd ..";
    "vi" = "emacsclient -c -a ''";
    "wmenu-run" = "wmenu-run -f 'Jetbrains Mono 12'";
    "mydwl" = "exec mydwl";
    "menuconfig" = "MENUCONFIG_COLOR=blackbg menuconfig";
    "screenshot" = "slurp | grim -g -"; # to use: screenshot <screenshot>.png
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
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
    ### LSP ###
    nixd
    nixfmt-rfc-style
    bash-language-server
    ccls
    jdt-language-server
    vscode-langservers-extracted
  ];
  home.file = {
    ".emacs.d/init.el".source = ./emacs/init.el;
    ".config/foot/foot.ini".source = ./foot/foot.ini;
    ".ssh/id_deploy".source = ./ssh/id_deploy;
    ".ssh/id_deploy.pub".source = ./ssh/id_deploy.pub;
    ".ssh/id_ed25519".source = ./ssh/id_ed25519;
    ".ssh/id_ed25519.pub".source = ./ssh/id_ed25519.pub;
    ".ssh/known_hosts".source = ./ssh/known_hosts;
  };
  home.sessionVariables = {
    EDITOR = "emacsclient -c -a ''";
  };
}
