{ config, ... }: {
  theme =
    let
      inherit (config.lib.formats.rasi) mkLiteral;
    in
    {
      "*" = with config.colorScheme.colors; {
        bg-col = mkLiteral "${base01}";
        bg-col-light = mkLiteral "${base01}";
        border-col = mkLiteral "${base0D}";
        selected-col = mkLiteral "${base01}";
        accent = mkLiteral "${base0D}";
        fg-col = mkLiteral "${base05}";
        grey = mkLiteral "${base04}";

        width = 600;
        font = "JetBrains Mono Nerd Font 14";
      };

      "element-text,element-icon,mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = 360;
        border = 1;
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
        border-radius = 8;
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = mkLiteral "[ prompt, entry ]";
        background-color = mkLiteral "@bg-col";
        border-radius = 8;
        padding = 2;
      };

      "prompt" = {
        background-color = mkLiteral "@accent";
        padding = 6;
        text-color = mkLiteral "@bg-col";
        border-radius = 8;
        margin = mkLiteral "20 0 0 20";
      };

      "textbox-prompt-colon" = {
        expand = false;
        str = ":";
      };

      entry = {
        padding = 6;
        margin = mkLiteral "20 0 0 10";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "listview" = {
        border = mkLiteral "0 0 0";
        padding = mkLiteral "6 0 0";
        margin = mkLiteral "10 0 0 20";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = 5;
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {
        size = 25;
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@accent";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = 10;
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@accent";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = 2;
        padding = 2;
        border-radius = 8;
      };

      "textbox" = {
        padding = 6;
        margin = mkLiteral "20 0 0 20";
        text-color = mkLiteral "@accent";
        background-color = mkLiteral "@bg-col-light";
      };
    };
}
