{
  pkgs,
  config,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings =  with config.colorScheme.colors; {
      screenshots = true;
      clock = true;
      timestr = "%I:%M:%S %p";
      effect-blur = "7x8";
      font = "JetBrains Mono Nerd Font";
      font-size = 18;
      indicator-idle-visible = true;
      key-hl-color = "${base08}";
      ring-color = "${base04}";
      ring-wrong-color = "${base08}";
      ring-clear-color = "${base09}";
      ring-ver-color = "${base0E}";
      inside-color = "${base00}";
      inside-wrong-color = "${base08}";
      inside-ver-color = "${base0D}";
      line-color = "${base01}";
      indicator-thickness = 6;
      text-color = "${base05}";
      text-clear-color = "${base06}";
      text-caps-lock-color = "${base05}";
      text-ver-color = "${base01}";
      text-wrong-color = "${base01}";
    };
  };
}
