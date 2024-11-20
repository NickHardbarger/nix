{ config, pkgs, ... }:
{
  home = {
    username = "nickh";
    homeDirectory = "/home/nickh";
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
        safe.directory = "/home/nickh/nil";
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
        #~/nil/system/fetch/fetch.pl
        ~/nil/system/fetch/fetch.sh
      '';
    };
    emacs = {
      enable = true;
      package = pkgs.emacs-nox; # change to emacs-wayland when it becomes available on nixos
      extraPackages = epkgs: [
        epkgs.use-package # emacs package config
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
        epkgs.org-bullets # org mode bullets
        epkgs.ivy # completion
        epkgs.multiple-cursors # multiple cursors
        epkgs.org-auto-tangle # auto tangle org files
        epkgs.diminish # cleans up modeline
        epkgs.page-break-lines # makes page breaks prettier
        epkgs.nerd-icons # adds nerd icons
        epkgs.dashboard # adds a dashboard
        epkgs.fireplace # adds a cozy fireplace
        epkgs.editorconfig # coding styles
        epkgs.doom-modeline # fancy modeline
        epkgs.poly-org # allows multiple major modes in .org files
        epkgs.linum-relative # relative line nums
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
    #"sudo" = "doas";
    "vi" = "emacs -nw";
    "vim" = "emacsclient -c -a ''";
    "dwl" = "exec mydwl";
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
    perlnavigator
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
