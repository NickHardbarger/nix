{
  config, # unneeded?
  pkgs,
  inputs,
  lib, # unneeded?
  ...
}:

{

  imports = [
    inputs.home-manager.nixosModules.default
    ../modules/firefox.nix
    ../modules/fail2ban.nix
    ../modules/ssh.nix
    ../modules/steam.nix
    ../modules/foot.nix
    ../modules/starship.nix
    ../modules/nh.nix
    ../modules/nix.nix
    ../modules/boot.nix
    ../modules/firewall.nix
    ../modules/bluetooth.nix
    ../modules/audio.nix
    ../modules/locale.nix
    ../modules/gpu.nix
    ../modules/xorg.nix
    ../modules/doas.nix
    ../modules/scx.nix
    ../modules/users.nix
  ];
  networking = {
    hostName = "t420";
    networkmanager.enable = true;
    #proxy.default = "http://user:password@proxy:port/";
    #proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  };
  services = {
    printing.enable = true;
    ollama.enable = false;
  };
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  virtualisation.virtualbox.host.enable = true;
  programs = {
    nix-ld.enable = true;
    bash.blesh.enable = true;
    nano.enable = false;
  };
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    ### DWL ###
    wmenu # app launcher
    (import ./scripts/wmenu.nix { inherit pkgs; })
    #wbg # wallpaper setter #!!build failure
    swaybg # wallpaper setter
    grim # screenshots
    slurp # screen select
    wl-clipboard # clipboard

    ### CLI SCRIPTS ###
    speedtest-cli # test network speed
    cmatrix # matrix text scroll
    cowsay # generates ascii cow with message
    sl # steam locomotive on ls typo

    ### MISC ###
    (import ./scripts/emacs.nix { inherit pkgs; })
    mangohud # steam hud overlay
    wget # file retriever
    pulseaudio # ?? I forget why that's there lol
    discord # chat client
    libreoffice # office suite
  ];
  fonts.packages = with pkgs; [
    #(nerdfonts.override { fonts = [ "JetBrainsMono" ]; }) # old
    nerd-fonts.jetbrains-mono # new
  ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
