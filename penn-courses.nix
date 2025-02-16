{ nixpkgs }: {
  devShells.x86_64-linux.penn-courses-backend =
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    pkgs.mkShell {
      packages = with pkgs; [
        python311Packages.uv
      ];
    };
}
