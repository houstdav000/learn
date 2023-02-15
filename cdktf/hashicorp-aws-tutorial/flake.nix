{
  description = "A basic starter flake for cdktf";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            nodePackages.cdktf-cli
            nodePackages.eslint
            nodePackages.prettier
            nodejs_latest
            terraform
            nodePackages.ts-node
            nodePackages.typescript
          ];
        };
      });
}
