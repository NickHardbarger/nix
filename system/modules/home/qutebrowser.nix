{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      #config.source('qutemacs.py')
      config.source('custom.py')
    '';
  };

  home.file = {
    ".config/qutebrowser/qutemacs.py".source = ../../qutebrowser/qutemacs.py;
    ".config/qutebrowser/custom.py".source = ../../qutebrowser/custom.py;
    ".config/qutebrowser/greasemonkey/youtube.js".source = ../../qutebrowser/youtube.js;
    ".config/qutebrowser/styles/youtube.css".source = ../../qutebrowser/youtube.css;
    ".config/qutebrowser/styles/theme.css".source = ../../qutebrowser/theme.css;
  };
}
