{
  buildFHSEnv,
  uv,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-courses";
  targetPkgs = pkgs: [
    uv
    libz
  ];
}).env
