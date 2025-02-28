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
