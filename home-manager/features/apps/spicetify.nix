{
  pkgs,
  spicetify-nix,
  ...
}: 
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin-mocha;

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      adblock
    ];
    
    enabledCustomApps = with spicePkgs.apps; [
      lyrics-plus
    ];
  };
}
