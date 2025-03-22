{
  buildFHSEnv,
  uv,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-mobile";
  targetPkgs = pkgs: [
    uv
    libz
  ];
}).env
