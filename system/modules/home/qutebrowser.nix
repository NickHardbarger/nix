{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    extraConfig = ''
      config.source('qutemacs.py')
    '';
  };

  home.file = {
    ".config/qutebrowser/qutemacs.py".source = ../../qutebrowser/qutemacs.py;
  };
}
