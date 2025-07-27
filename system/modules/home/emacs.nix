{ pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs30-pgtk;
  };
  home = {
    packages = with pkgs; [
      nixd
      nixfmt-rfc-style

      ccls
      gopls

      vscode-langservers-extracted
      typescript-language-server

      jdt-language-server
      csharp-ls

      # For org-mode
      pandoc
    ];
    file = {
      ".emacs.d/early-init.el".source = ../../emacs/early-init.el;
      ".emacs.d/init.el".source = ../../emacs/init.el;

      ".emacs.d/init-elpaca.el".source = ../../emacs/init-elpaca.el;
      ".emacs.d/init-org.el".source = ../../emacs/init-org.el;
      ".emacs.d/init-pretty.el".source = ../../emacs/init-pretty.el;
      ".emacs.d/init-git.el".source = ../../emacs/init-git.el;
      ".emacs.d/init-completions.el".source = ../../emacs/init-completions.el;
      ".emacs.d/init-prog.el".source = ../../emacs/init-prog.el;

      ".emacs.d/ding.wav".source = ../../emacs/ding.wav;
    };
    sessionVariables = {
      EDITOR = "emacs";
    };
  };
}
