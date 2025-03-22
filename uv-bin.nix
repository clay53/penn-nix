{
  stdenvNoCC,
  autoPatchelfHook,
  fetchurl,
  libgcc,
  ...
}:
let
  platform =
    {
      x86_64-linux = "x86_64-unknown-linux-gnu";
      x86_64-darwin = "macos-x86_64";
      aarch64-darwin = "arm64-apple-darwin";
    }
    .${stdenvNoCC.system} or (throw "unsupported system ${stdenvNoCC.system}");
  hash =
    {
      x86_64-linux = "sha256-ABuHoMLqZCo8damMavPoUoqkc9Vg5lPPIT78yaqkoCg=";
      x86_64-darwin = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
      aarch64-darwin = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
    }
    .${stdenvNoCC.system} or (throw "unsupported system ${stdenvNoCC.system}");
in
stdenvNoCC.mkDerivation rec {
  pname = "waypoint-client";
  version = "0.6.9";

  src = fetchurl {
    url = "https://github.com/astral-sh/uv/releases/download/${version}/uv-${platform}.tar.gz";
    inherit hash;
  };
  sourceRoot = ".";

  nativeBuildInputs = [
    autoPatchelfHook
    libgcc
  ];

  installPhase = ''
    mkdir -p $out/bin
    ls .
    cp -r uv-${platform}/. $out/bin/
    chmod +x $out/bin/.
  '';
}
