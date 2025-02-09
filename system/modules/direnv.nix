{
  ...
}:
{
  programs.direnv = {
    enable = true;
    silent = false;
    loadInNixShell = true;
    nix-direnv.enable = true;
    direnvrcExtra = ''
      echo "loaded direnv!"
    '';
  };
}
