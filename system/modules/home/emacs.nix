{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };
  home = {
    packages = with pkgs; [
      # # this adds a command 'my-hello' to your environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
      nixd
      nixfmt-rfc-style
      bash-language-server
      perlnavigator
      ccls
      jdt-language-server
      vscode-langservers-extracted
    ];
    file = {
      ".emacs.d/early-init.el".source = ../../emacs/early-init.el;
      ".emacs.d/init.el".source = ../../emacs/init.el;
      ".emacs.d/ding.wav".source = ../../emacs/ding.wav;
    };
    sessionVariables = {
      EDITOR = "emacsclient -c -a ''";
    };
  };
}
