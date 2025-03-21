{
  description = "Nix packages and devshells for Penn Labs projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system}.extend self.overlays.${system};
      in
      {
        packages = {
          waypoint-client = import ./waypoint-client.nix pkgs;
          uv-bin = import ./uv-bin.nix pkgs;
        };
        devShells = {
          penn-clubs = import ./penn-clubs/shell.nix pkgs;
          platform = import ./platform/shell.nix pkgs;
          penn-courses = import ./penn-courses/shell.nix pkgs;
          ohq = import ./ohq/shell.nix pkgs;
          penn-mobile = import ./penn-mobile/shell.nix pkgs;
        };
        formatter = pkgs.nixfmt-rfc-style;
        overlays = final: prev: {
          uv-bin = self.packages.${system}.uv-bin;
        };
      }
    );
}
