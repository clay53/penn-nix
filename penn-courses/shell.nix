{
  buildFHSEnv,
  uv-bin,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-penn-courses";
  targetPkgs = pkgs: [
    uv-bin
    libz
  ];
}).env
