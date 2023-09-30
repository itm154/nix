{
  pkgs,
  osConfig,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./config.nix
  ];

  home  = {
    # WM packages
    packages = with pkgs; [
      brightnessctl
      pamixer
      playerctl

      wlr-randr
      wl-clipboard

      rofi-wayland

      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
  };
}