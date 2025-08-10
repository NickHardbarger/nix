{
  myUser,
  ...
}:
{
  # Don't forget to set a password with ‘passwd’.
  users.users.${myUser} = {
    isNormalUser = true;
    description = "${myUser}";
    initialPassword = "${myUser}";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
    ];
  };
}
