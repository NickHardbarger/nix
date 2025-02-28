{
  inputs,
  pkgs,
  lib,
  ...
}:
{
  programs.floorp = {
    enable = true;
    profiles."nickh" = {
      bookmarks = [
        {
          name = "YouTube";
          url = "https://www.youtube.com/";
        }
      ];
    };
  };
}
