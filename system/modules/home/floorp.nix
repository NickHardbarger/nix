{
  pkgs,
  ...
}:
{
  programs.floorp = {
    enable = true;
    package = pkgs.floorp;
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
