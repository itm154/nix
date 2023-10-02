{
  config,
  ...
}: {
  services.mako = with config.colorScheme.colors; {
    enable = true;
    backgroundColor = "#${base00}";
    borderColor = "#${base08}";
    borderSize = 2;
    output = "eDP-1";
    textColor = "#${base05}";
    font = "JetBrains Mono Nerd Font 16";
    width = 250;
    height = 200;
    defaultTimeout = 3000;
  };
}
