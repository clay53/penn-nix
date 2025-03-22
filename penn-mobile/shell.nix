{
  buildFHSEnv,
  uv-bin,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-mobile";
  targetPkgs = pkgs: [
    uv-bin
    libz
  ];
}).env
