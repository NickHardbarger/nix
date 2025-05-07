{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };
  home = {
    packages = with pkgs; [
      (pkgs.writeShellScriptBin "vi" "emacsclient -c -a ''")

      nixd
      nixfmt-rfc-style

      bash-language-server
      # ccls
      clang-tools

      vscode-langservers-extracted
      typescript-language-server

      jdt-language-server
      # omnisharp-roslyn
      csharp-ls
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
