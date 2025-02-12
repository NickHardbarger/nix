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
      ".config/eww/eww.yuck".source = ../../eww/eww.yuck;
      ".config/eww/eww.css".source = ../../eww/eww.css;
    };
  };
}
