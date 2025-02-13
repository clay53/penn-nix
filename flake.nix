{
  description = "Nix packages and devshells for Penn Labs projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    waypoint-client-bin-linux_x86_64 = {
      url = "https://github.com/pennlabs/infrastructure/releases/download/v0.0.2.11/waypoint-client-linux-x86_64";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, waypoint-client-bin-linux_x86_64 }: {
    packages.x86_64-linux.waypoint-client =
      nixpkgs.legacyPackages.x86_64-linux.stdenv.mkDerivation {
        name = "waypoint-client";
	src = waypoint-client-bin-linux_x86_64;
	dontUnpack = true;

        installPhase = ''
          mkdir -p $out/bin
	  cp $src $out/bin/waypoint-client
	  chmod +x $out/bin/waypoint-client
        '';
      };
  };
}
