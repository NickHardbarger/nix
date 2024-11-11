{ config, pkgs, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      slstatus = super.slstatus.overrideAttrs (oldAttrs: rec {
        patches = [
          ./slstatus-kanji-20240614-f68f492.diff
        ];
      });
    })
  ];
}
