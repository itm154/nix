{
  config,
  pkgs,
  ...
}: {
  gtk = {
    enable = true;
    gtk3 = {
      extraConfig = {
        "gtk-decoration-layout" = "menu:";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        accent = "red";
      };
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Red-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "red" ];
        size = "standard";
        tweaks = [ "normal" ];
        variant = "mocha";
      };
    };
  };

  home.packages = with pkgs; [
    gradience
  ];
}
