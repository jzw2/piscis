{
  description = "A simple Nix Flake for running a Prolog script";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.scryer.url = "github:jzw2/scryer-prolog";

  outputs = { self, nixpkgs, scryer}:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-darwin;
      prolog = scryer.defaultPackage.x86_64-darwin;
    in
    {
      defaultPackage.x86_64-darwin = pkgs.writeShellScriptBin "piscis" ''
        #!/bin/sh
        exec ${prolog}/bin/scryer-prolog ${self}/main.pl -g main
      '';
    };
}
