{
  pkgs,
  ...
}:
{
  programs.chromium = {
    enable = false;
    package = pkgs.ungoogled-chromium;
  };
}
