{
  buildFHSEnv,
  uv-bin,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-clubs";
  targetPkgs = pkgs: [
    uv-bin
    libz
  ];
}).env
