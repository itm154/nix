{
  pkgs,
  ...
}: {
  additionalPackages = with pkgs; [
    gnome.nautilus

    # wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull
    protonup-qt
    lutris
  ];
}
