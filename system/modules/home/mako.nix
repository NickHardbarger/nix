{ config, pkgs, ... }:
{
  services.mako = {
    enable = true;
    font = "JetBrainsMonoNF 12";
    backgroundColor = "#458588FF";
    borderColor = "#689d6aFF";
    textColor = "#ebdbb2FF";
  };
}
