{
  myUser,
  ...
}:
{
  programs.nh = {
    enable = true;
    flake = "/home/${myUser}/nix";
    clean = {
      enable = true;
      #dates = weekly; # doesn't work??
      extraArgs = "--keep 3 --keep-since 3d";
    };
  };
}
