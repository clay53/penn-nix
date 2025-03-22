{
  buildFHSEnv,
  uv,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-ohq";
  targetPkgs = pkgs: [
    uv
    libz
  ];
}).env
