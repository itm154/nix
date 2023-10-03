{
  pkgs,
  ...
}: {
  home.pointerCursor = {
    name = "Catppuccin-Mocha-Dark";
    package = pkgs.catppuccin-cursors.mochaDark;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
