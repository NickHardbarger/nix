pfetch
export EDITOR=nvim
alias bashrc='emacsclient ~/nicksOS/hosts/default/bash'
alias swayrc='emacsclient ~/nicksOS/hosts/default/sway'
alias statusrc='emacsclient ~/nicksOS/hosts/default/i3status'
alias menurc='emacsclient ~/nicksOS/hosts/default/tofi'
alias nixrc='sudoedit ~/nicksOS/hosts/default/configuration.nix'
alias flakerc='sudoedit ~/nicksOS/flake.nix'
alias hardrc='sudoedit ~/nicksOS/hosts/default/hardware-configuration.nix'
alias horse='sudoedit ~/nicksOS/hosts/default/home.nix'
alias irs='sudo nixos-rebuild switch --flake ~/nicksOS#default'
alias buildflags='nix edit -f "<nixpkgs>"'
