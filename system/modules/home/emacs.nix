{ pkgs, ... }:
{
  # Need gopls 0.14.2 to work with gccgo
  # nixpkgs.overlays = [
  # (self: super: {
  # gopls = super.gopls.overrideAttrs {
  # src = fetchTarball {
  # url = "https://github.com/golang/tools/archive/refs/tags/gopls/v0.14.2.tar.gz";
  # sha256 = "0qyqrjdrhdcz5a5c8iyyvrrwidxh9nn23z18v4b6vshsk4irrj45";
  # };
  # };
  # })
  # ];
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

      # go language server requires go in PATH
      # so I have to install go with direnv to have lsp support...
      # NB: "nix-shell -p go" doesn't work...
      # also, I can't use gopls 0.18.1 with gccgo... -_-
      gopls
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
