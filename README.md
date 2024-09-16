# Installation
To install nicksOS on a fresh NixOS system, run these commands:
```
nix-shell -p git
```
```
cd
git clone https://github.com/NickHardbarger/nicksOS
```
```
sudo rm /etc/nixos/configuration.nix
```
```
sudo mv /etc/nixos/hardware-configuration.nix ~/nicksOS/hosts/default/
```
```
sudo nixos-rebuild switch --flake ~/nicksOS#default
```