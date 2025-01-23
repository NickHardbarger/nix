{ config, pkgs, ... }:
{
  imports = [
    ../modules/home/git.nix
    ../modules/home/btop.nix
    ../modules/home/bash.nix
  ];
  home = {
    username = "nickh";
    homeDirectory = "/home/nickh";
  };
  ### PROGRAMS ###
  programs = {
    home-manager = {
      enable = true;
    };
    emacs = {
      enable = true;
      package = pkgs.emacs30-pgtk;
    };
    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
      ];
    };
  };
  ### SERVICES ###
  services = {
    mako = {
      enable = true;
      font = "JetBrainsMonoNF 12";
      backgroundColor = "#458588FF";
      borderColor = "#689d6aFF";
      textColor = "#ebdbb2FF";
    };
  };
  home.shellAliases = {
    "cmatrix" = "cmatrix -C cyan";
    ".." = "cd ..";
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
  home.enableNixpkgsReleaseCheck = false;
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
    ".emacs.d/early-init.el".source = ../emacs/early-init.el;
    ".emacs.d/init.el".source = ../emacs/init.el;
    ".emacs.d/ding.wav".source = ../emacs/ding.wav;
  };
  home.sessionVariables = {
    EDITOR = "emacsclient -c -a ''";
  };
}
