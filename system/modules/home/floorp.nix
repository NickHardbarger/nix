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
          toolbar = true;
          url = "https://www.youtube.com/";
        }
      ];
    };
  };
}
