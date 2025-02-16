{ nixpkgs, x86_64-linux-bin }: {
  packages.x86_64-linux.waypoint-client =
    nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
      name = "waypoint-client";
      src = x86_64-linux-bin;
      dontUnpack = true;
  
      installPhase = ''
        mkdir -p $out/bin
        cp $src $out/bin/waypoint-client
        chmod +x $out/bin/waypoint-client
      '';
    };
}
