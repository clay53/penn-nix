{
  buildFHSEnv,
  uv-bin,
  libz,
  ...
}:
(buildFHSEnv {
  name = "pennlabs-ohq";
  targetPkgs = pkgs: [
    uv-bin
    libz
  ];
}).env
