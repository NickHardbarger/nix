{
  inputs,
  myUser,
  ...
}:
{
  # Don't forget to set a password with ‘passwd’.
  users.users.${myUser} = {
    isNormalUser = true;
    description = "Nick";
    initialPassword = "1337";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
    ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit inputs myUser;
    };
    users = {
      ${myUser} = import ../hosts/t420/home.nix;
    };
  };
}
