{
  description = "My NixOs Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };
  outputs = { self, nixpkgs }:

  # Variables
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in 

  # Main block
  {
    nixosConfigurations = {
      itm154-nix = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit system; };
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };
  };
}
