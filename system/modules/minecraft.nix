{ pkgs, ... }:
{
  services.minecraft-server = {
    enable = true;
    eula = true;
    declarative = true;
  };
  environment.systemPackages = with pkgs; [ prismlauncher ];
}
