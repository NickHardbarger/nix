{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisplayBookmarksToolbar = "always";
      #ExtensionSettings = {};
      #preferences = {};
    };
  };
}
