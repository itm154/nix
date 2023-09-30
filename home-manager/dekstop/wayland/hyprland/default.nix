{
  pkgs,
  osConfig,
  lib,
  ...
}: {
  imports = [
    ./config.nix
  ];

  home  = {
    # WM packages
    packages = with pkgs; [
      wlr-randr
      wl-clipboard
    ];
    
    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      enable.xwayland = true;
    };
  };
}
