{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.foot = {
    enable = true;
    theme = "gruvbox-dark";
    settings = {
      main = {
        font = "JetBrainsMonoNF:size=12";
        pad = "10x10";
      };
      colors.alpha = 0.9;
      scrollback.lines = 100000;
    };
  };
}
