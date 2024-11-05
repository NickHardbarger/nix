{ config, pkgs, dwl-source, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      dwl = super.dwl.overrideAttrs (oldAttrs: rec {
        src = dwl-source;
	patches = [
	  ./client-opacity.patch
	  ./swallow.patch
	  ./autostart-0.7.patch
	  ./vanitygaps-0.7.patch
	  #./bar-0.7.patch
	];
      });
    })
  ];
}