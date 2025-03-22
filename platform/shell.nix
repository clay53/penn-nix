{
  buildFHSEnv,
  uv,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-platform";
  targetPkgs = pkgs: [
    uv
    libz
  ];
}).env
