{
  description = "My NixOs Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:

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
        specialArgs = { inherit inputs system; };
        modules = [
          ./nixos/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      itm154 = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home-manager/home.nix
          hyprland.homeManagerModules.default
          { wayland.windowManager.hyprland.enable = true; }
        ];
      };
    };
  };
}
