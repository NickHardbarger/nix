{
  pkgs,
  ...
}:
{
  # Doesn't work... ew.
  #programs.eww = {
  # enable = true;
  # package = pkgs.eww;
  # configDir = ../../eww;
  #};
  home = {
    packages = [ pkgs.eww ];
    file = {
      ".config/eww.yuck".source = ../../eww/eww.yuck;
    };
  };
}
