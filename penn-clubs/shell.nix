{
  buildFHSEnv,
  uv,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-clubs";
  targetPkgs = pkgs: [
    uv
    libz
  ];
}).env
