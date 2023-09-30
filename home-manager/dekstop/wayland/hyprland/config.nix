{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 12;
      border_size = 2;

      "col.active_border" = "#F38BA8";
      "col.inactive_border" = "#F38BA8";
    };

    decoration = {
       active_opacity = 1.0;
      inactive_opacity = 0.85;
      fullscreen_opacity = 1.0;
      rounding = 12;

      blur = {
        enabled = true;
        size = 5;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = false;
      };
    };
  };
}
