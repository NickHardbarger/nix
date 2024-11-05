{ config, pkgs, slstatus-source, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      slstatus = super.slstatus.overrideAttrs (oldAttrs: rec {
        src = slstatus-source;
	patches = [
	  ./slstatus-kanji-20240614-f68f492.diff
	];
      });
    })
  ];
}