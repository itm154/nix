{ config, pkgs, ... }: 

{
  wayland.windowManager.hyprland = {
    settings = {
      "$MOD" = "SUPER";
      general = {
        gaps_in = 4;
        gaps_out = 12;
        border_size = 2;
      };
      bind = [
        "$MOD, B, exec, firefox"
      ];
    };
  };
}
