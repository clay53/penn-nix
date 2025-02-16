{
  description = "Nix packages and devshells for Penn Labs projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    waypoint-client-bin-x86_64-linux = {
      url = "https://github.com/pennlabs/infrastructure/releases/download/v0.0.2.11/waypoint-client-linux-x86_64";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, ... }@inputs:
  import ./waypoint-client.nix { inherit nixpkgs; x86_64-linux-bin = inputs.waypoint-client-bin-x86_64-linux; }
  // import ./penn-clubs.nix { inherit nixpkgs; }
  // import ./platform.nix { inherit nixpkgs; }
  // import ./penn-courses.nix { inherit nixpkgs; }
  // import ./ohq.nix { inherit nixpkgs; }
  // import ./penn-mobile.nix { inherit nixpkgs; }
  ;
}
