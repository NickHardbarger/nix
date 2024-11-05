{ config, pkgs, ... }: {
  nixpkgs.overlays = [
    (self: super: {
      dwl = super.dwl.overrideAttrs (oldAttrs: rec {
        #src = dwl-source;
	patches = [
	  ./autostart-0.7.patch
	  ./bar-0.7.patch
	  #./client-opacity.patch
	  ./swallow.patch
	  ./vanitygaps-0.7.patch
	];
      });
    })
  ];
}