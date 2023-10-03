{
  pkgs,
  inputs,
  ...
}: {
  imports = [./config.nix];

  home = {
    # WM packages
    packages = with pkgs; [
      brightnessctl
      pamixer
      playerctl

      wlr-randr
      wl-clipboard

      inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
      hyprpaper
    ];

    sessionVariables = {
      GDK_BACKEND = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      WLR_NO_HARDWARE_CURSORS = "1";
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
}
