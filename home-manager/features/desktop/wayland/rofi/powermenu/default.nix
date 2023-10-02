{ config, pkgs, lib, ... }: let
  desktop = "hyprland";
in {
  # For some reason, waybar cannot find rofi in the path when executing this script.
  # This hack just hard-codes the path at the top of the file, with the packages needed
  rofi-power = pkgs.writeShellScriptBin "rofi-power-menu" ''
      export PATH=${lib.makeBinPath (with pkgs;[
      rofi-wayland
      systemd
    ]
    ++ lib.optional (desktop =="hyprland") hyprland)}
    
    ${(builtins.readFile ./powermenu.sh)}
  '';

  theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "configuration" = {
        show-icons = false;
      };

      "*" = with config.colorScheme.colors; {
        background = mkLiteral "#${base00}";
        background-alt = mkLiteral "#${base01}";
        foreground = mkLiteral "#${base05}";
        accent = mkLiteral "#${base08}";
        active = mkLiteral "#${base0B}";
        urgent = mkLiteral "#${base0D}";

        font = "JetBrains Mono Nerd Font 24";
      };

      "window" = {
        # properties for window widget
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = 800;
        x-offset = 0;
        y-offset = 0;

        # properties for all widgets
        enabled = true;
        margin = 0;
        padding = 0;
        border = mkLiteral "1px solid";
        border-radius = 12;
        border-color = mkLiteral "@accent";
        cursor = "default";
        background-color = mkLiteral "@background";
      };

      "mainbox" = {
        enabled = true;
        spacing = 15;
        margin = 0;
        padding = 30;
        border = 0;
        border-radius = 0;
        border-color = mkLiteral "@accent";
        background-color = mkLiteral "transparent";
        children = mkLiteral "[ \"listview\" ]";
      };

      "inputbar" = {
        enabled = false;
      };

      "dummy" = {
        background-color = mkLiteral "transparent";
      };

      "listview" = {
        enabled = true;
        columns = 5;
        lines = 1;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;

        spacing = 15;
        margin = 0;
        padding = 0;
        border = 0;
        border-radius = 0;
        border-color = mkLiteral "@accent";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = "default";
      };

      "element" = {
        enabled = true;
        spacing = 0;
        margin = 0;
        padding = mkLiteral "40 10";
        border = 0;
        border-radius = 12;
        border-color = mkLiteral "@accent";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };
      "element-text" = {
        font = "feather bold 32";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };
      "element selected.normal" = {
        background-color = mkLiteral "var(accent)";
        text-color = mkLiteral "var(background)";
      };
    };
}
