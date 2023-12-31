{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit ((import ./lib.nix {inherit lib;})) toRasi;

  powermenu = import ./powermenu {inherit config pkgs lib;};
  rofiTheme = (import ./theme.nix {inherit pkgs config;}).theme;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = rofiTheme;
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
    ];

    extraConfig = {
      modi = "drun,emoji,calc";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-emoji = "   Emoji ";
      display-calc = "   Calc ";
      sidebar-mode = true;
    };
  };

  home = {
    packages = [powermenu.rofi-power];
    file = {
      ".config/rofi/powermenu.rasi".text = toRasi powermenu.theme;
    };
  };
}
