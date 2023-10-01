{ inputs, config, pkgs, ... }: {
  imports = [ inputs.nix-doom-emacs.hmModule ];
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./config;
  };
}
