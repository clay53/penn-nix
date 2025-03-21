{ nixpkgs }: {
  packages.x86_64-linux.waypoint-client =
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    pkgs.stdenv.mkDerivation rec {
      name = "waypoint-client";
      version = "1.0.3";

      src = pkgs.fetchurl {
        url = "https://github.com/pennlabs/infrastructure/releases/download/v${version}/waypoint-client-linux-x86_64";
        hash = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
      };
      dontUnpack = true;

      nativeBuildInputs = [
        pkgs.autoPatchelfHook
        pkgs.libz
      ];
  
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/waypoint-client
        chmod +x $out/bin/waypoint-client
      '';
    };
}
