{
  pkgs,
  ...
}:
{
  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # old
    nerd-fonts.jetbrains-mono # new
    noto-fonts-cjk-sans # cjk support
  ];
  console.font = null; # TODO: figure out console fonts
}
