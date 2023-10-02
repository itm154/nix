{ inputs, outputs, pkgs, ... }:
let
  softwareConfig = import ./features/apps/software.nix;
in {
  imports = [
    ./features
    inputs.hyprland.homeManagerModules.default
    { wayland.windowManager.hyprland.enable = true; }

    inputs.nix-colors.homeManagerModules.default
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages

      # You can also add overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  home.username = "itm154";
  home.homeDirectory = "/home/itm154";

  home.packages = with pkgs; lib.concatLists [ softwareConfig.additionalPackages [ kitty lxde.lxsession ] ];
  home.sessionVariables = { EDITOR = "nvim"; };

  programs.neovim.enable = true;

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
