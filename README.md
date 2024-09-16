# Installation
nicksOS is installable on any NixOS system. Just run these commands:
```
nix-shell -p git vim
```
```
git clone https://github.com/NickHardbarger/nicksOS
```
```
sudo rm /etc/nixos/configuration.nix
```
```
sudo mv /etc/nixos/hardware-configuration.nix ~/nicksOS/hosts/default/
```
```
cd nicksOS
```
```
sudo nixos-rebuild switch --flake ~/nicksOS#default
```