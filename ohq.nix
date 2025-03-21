{ nixpkgs }: {
  devShells.x86_64-linux.ohq =
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    pkgs.mkShell {
      packages = with pkgs; [
        python311Packages.uv
      ];
    };
}
