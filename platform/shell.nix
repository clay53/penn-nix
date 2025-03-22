{
  buildFHSEnv,
  uv-bin,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-platform";
  targetPkgs = pkgs: [
    uv-bin
    libz
  ];
}).env
