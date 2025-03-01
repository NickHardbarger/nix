{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    font = "JetBrainsMonoNF 12";
    backgroundColor = "#282828FF";
    borderColor = "#cc241dFF";
    textColor = "#ebdbb2FF";
  };
}
