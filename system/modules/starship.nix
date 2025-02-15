{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      format = "[╭─](bold blue)$all$directory\n[╰─](bold blue)$character";
      character = {
        success_symbol = "[󰘧](bold green)";
        error_symbol = "[󰘧](bold red)";
      };
    };
  };
}
