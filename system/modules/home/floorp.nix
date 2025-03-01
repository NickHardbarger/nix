{
  pkgs,
  ...
}:
{
  programs.floorp = {
    enable = true;
    package = pkgs.floorp;
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      # Cookies = "Allow"; TODO: figure out cookies setting
      DisableFormHistory = true;
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
    };
    profiles."nickh" = {
      bookmarks = [
        {
          name = "NixOS";
          toolbar = true;
          bookmarks = [
            {
              name = "YouTube";
              url = "https://www.youtube.com/";
            }
            {
              name = "GitHub";
              url = "https://github.com/dashboard";
            }
            {
              name = "nixpkgs";
              url = "https://search.nixos.org/packages?";
            }
            {
              name = "options";
              url = "https://search.nixos.org/options?";
            }
            {
              name = "home-manager";
              url = "https://home-manager-options.extranix.com/?query=&release=master";
            }
            {
              name = "melpa";
              url = "https://melpa.org/#/";
            }
            {
              name = "GPA Calc";
              url = "https://gpacalculator.net/college-gpa-calculator/";
            }
            {
              name = "Indeed";
              url = "https://www.indeed.com/?from=notifcenter_webapp_zero_notifications_page";
            }
            {
              name = "gruvbox";
              url = "https://github.com/morhetz/gruvbox";
            }
            {
              name = "calendar";
              url = "https://www.cotc.edu/sites/main/files/file-attachments/2024-2025_academic_calendar.pdf?1725366617";
            }
            {
              name = "breadcrumb";
              url = "https://github.com/joaotavora/breadcrumb";
            }
            {
              name = "scenefx";
              url = "https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/scenefx";
            }
            {
              name = "barborder";
              url = "https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/barborder/barborder.patch";
            }
          ];
        }
      ];
    };
  };
}
