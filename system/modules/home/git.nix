{
  config,
  pkgs,
  myUser,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Nick";
    userEmail = "nickhardbarger13@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/home/${myUser}/nix";
    };
  };
}
