{
  description = "Nix packages and devshells for Penn Labs projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = {
          waypoint-client = import ./waypoint-client.nix pkgs;
        };
        devShells = {
          penn-clubs = import ./penn-clubs/shell.nix pkgs;
          platform = import ./platform/shell.nix pkgs;
          penn-courses = import ./penn-courses/shell.nix pkgs;
          ohq = import ./ohq/shell.nix pkgs;
          penn-mobile = import ./penn-mobile/shell.nix pkgs;
        };
      }
    );
}
