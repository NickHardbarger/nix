{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      config.source('qutemacs.py')
      config.source('custom.py')
    '';
  };

  home.file = {
    ".config/qutebrowser/qutemacs.py".source = ../../qutebrowser/qutemacs.py;
    ".config/qutebrowser/custom.py".source = ../../qutebrowser/custom.py;
  };
}
