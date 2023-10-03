# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
# pkgs: {
#   # example = pkgs.callPackage ./example { };
#   nvchad = pkgs.nvchad ./nvchad { };
# }
{ pkgs ? (import ../nixpkgs.nix) {}}: {
  nvchad = pkgs.callPackage ./nvchad {};
}
