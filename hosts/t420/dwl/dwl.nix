{ config, pkgs, dwl-source, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      dwl = super.dwl.overrideAttrs (oldAttrs: rec {
        src = dwl-source;
	patches = [
	  ./bar-0.7.patch
	];
      });
    })
  ];
}