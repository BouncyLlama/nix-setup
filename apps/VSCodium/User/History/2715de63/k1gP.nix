{

  description = "One flake to rule them all";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

    outputs = { self, nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
    nixosConfigurations = {
      niki = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
        };
      };
}
