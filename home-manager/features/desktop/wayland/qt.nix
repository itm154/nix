{pkgs, ...}: let
  catppuccin = pkgs.catppuccin-kvantum.override {
    variant = "Mocha";
    accent = "Red";
  };
in {
  qt = {
    enable = true;
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [
      catppuccin
      libsForQt5.qtstyleplugin-kvantum
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qt5ct
      lxqt.lxqt-panel
      lxqt.lxqt-themes
      lxqt.lxqt-config
      lxqt.lxqt-qtplugin
      catppuccin-kvantum
    ];
    sessionVariables = {
      "QT_STYLE_OVERRIDE" = "kvantum";
    };
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
    General.theme = "Catppuccin-Mocha-Red"; #"Catppuccin-Mocha-Mauve";
  };
}
