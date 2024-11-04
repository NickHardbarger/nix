{
  lib,
  fetchFromGitea,
  installShellFiles,
  libX11,
  libinput,
  libxcb,
  libxkbcommon,
  pixman,
  pkg-config,
  stdenv,
  testers,
  wayland,
  wayland-protocols,
  wayland-scanner,
  wlroots,
  writeText,
  xcbutilwm,
  xwayland,
  # Boolean flags
  enableXWayland ? true,
  withCustomConfigH ? (configH != null),
  # Configurable options
  configH ?
    if conf != null then
      lib.warn ''
        conf parameter is deprecated;
        use configH instead
      '' conf
    else
      null,
  # Deprecated options
  # Remove them before next version of either Nixpkgs or dwl itself
  conf ? null,
}:

# If we set withCustomConfigH, let's not forget configH
assert withCustomConfigH -> (configH != null);
stdenv.mkDerivation (finalAttrs: {
  pname = "dwl";
  version = "0.7";

  src = ./src;

  nativeBuildInputs = [
    installShellFiles
    pkg-config
    wayland-scanner
  ];

  buildInputs =
    [
      libinput
      libxcb
      libxkbcommon
      pixman
      wayland
      wayland-protocols
      wlroots
    ]
    ++ lib.optionals enableXWayland [
      libX11
      xcbutilwm
      xwayland
    ];

  outputs = [
    "out"
    "man"
  ];

  postPatch =
    let
      configFile =
        if lib.isDerivation configH || builtins.isPath configH then
          configH
        else
          writeText "config.h" configH;
    in
    lib.optionalString withCustomConfigH "cp ${configFile} config.h";

  makeFlags =
    [
      "PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
      "WAYLAND_SCANNER=wayland-scanner"
      "PREFIX=$(out)"
      "MANDIR=$(man)/share/man"
    ]
    ++ lib.optionals enableXWayland [
      ''XWAYLAND="-DXWAYLAND"''
      ''XLIBS="xcb xcb-icccm"''
    ];

  strictDeps = true;

  # required for whitespaces in makeFlags
  __structuredAttrs = true;

  passthru = {
    tests.version = testers.testVersion {
      package = finalAttrs.finalPackage;
      # `dwl -v` emits its version string to stderr and returns 1
      command = "dwl -v 2>&1; return 0";
    };
  };