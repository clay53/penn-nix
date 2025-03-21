{
  description = "Nix packages and devshells for Penn Labs projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      mergeSystems = oldSystems: newSystems:
        builtins.foldl'
          (acc: systemName: {
            ${systemName} =
              if acc ? ${systemName}
              then acc.${systemName} // newSystems.${systemName}
              else newSystems.${systemName};
          })
          oldSystems
          (builtins.attrNames newSystems);
      mergeOutputs = outputs:
        builtins.foldl'
          (acc: output: {
            packages =
              if output ? packages
              then mergeSystems acc.packages output.packages
              else acc.packages;
            devShells =
              if output ? devShells
              then mergeSystems acc.devShells output.devShells
              else acc.devShells;
          })
          { packages = {}; devShells = {}; }
          outputs;
    in
    mergeOutputs [
      (import ./waypoint-client.nix { inherit nixpkgs; })
      (import ./penn-clubs.nix { inherit nixpkgs; })
      (import ./platform.nix { inherit nixpkgs; })
      (import ./penn-courses.nix { inherit nixpkgs; })
      (import ./ohq.nix { inherit nixpkgs; })
      (import ./penn-mobile.nix { inherit nixpkgs; })
    ];
}
