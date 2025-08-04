{ myUser, ... }:
{
  imports = [
    ../../modules/home/cursor.nix
    ../../modules/home/emacs.nix
    ../../modules/home/git.nix
    ../../modules/home/mako.nix
    ../../modules/home/obs.nix
    ../../modules/home/qutebrowser.nix
  ];
  programs.home-manager.enable = true;
  home = {
    username = myUser;
    homeDirectory = "/home/${myUser}";
    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "24.05"; # Please read the comment before changing.
    enableNixpkgsReleaseCheck = false;
  };
}
