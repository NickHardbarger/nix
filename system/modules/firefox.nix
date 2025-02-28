{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  programs.firefox = {
    enable = false;
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
