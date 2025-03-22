{
  stdenvNoCC,
  autoPatchelfHook,
  libz,
  fetchurl,
  ...
}:
let
  platform =
    {
      x86_64-linux = "linux-x86_64";
      x86_64-darwin = "macos-x86_64";
      aarch64-darwin = "arm64-apple-darwin";
    }
    .${stdenvNoCC.system} or (throw "unsupported system ${stdenvNoCC.system}");
  hash =
    {
      x86_64-linux = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
      x86_64-darwin = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
      aarch64-darwin = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
    }
    .${stdenvNoCC.system} or (throw "unsupported system ${stdenvNoCC.system}");
in
stdenvNoCC.mkDerivation rec {
  pname = "waypoint-client";
  version = "1.0.3";

  src = fetchurl {
    url = "https://github.com/pennlabs/infrastructure/releases/download/v${version}/waypoint-client-${platform}";
    inherit hash;
  };
  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
    libz
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/waypoint-client
    chmod +x $out/bin/waypoint-client
  '';
}
