{
  config,
  pkgs,
  inputs,
  lib,
  myUser,
  ...
}:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      AllowUsers = [ "${myUser}" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "prohibit-password";
    };
  };
  programs.ssh.startAgent = true;
}
