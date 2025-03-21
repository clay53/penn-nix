{ nixpkgs }: {
  packages.x86_64-linux.waypoint-client =
    nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "waypoint-client";
      src = nixpkgs.legacyPackages.x86_64-linux.fetchurl {
        url = "https://github.com/pennlabs/infrastructure/releases/download/v1.0.3/waypoint-client-linux-x86_64";
        hash = "sha256-YAA9wH7NcN1u9dDsm3QbidnHGVey5zAqfF7aajFSQ3M=";
      };
      dontUnpack = true;
  
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/waypoint-client
        chmod +x $out/bin/waypoint-client
      '';
    };
}
