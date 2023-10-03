{
  lib,
  stdenv,
  pkgs,
}: let
  custom = ./custom;
in
  stdenv.mkDerivation (finalAttrs: {
    pname = "nvchad";
    version = "1.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "NvChad";
      repo = "NvChad";
      rev = "13e9b0f458c3e5e95ac05a10822f26dbb1aa03cb";
      hash = "sha256-fliUVs7vNozCyMwA40iTCHYt5PXYPF8A0dUUxMkNYho=";
    };

    installPhase = ''
      mkdir $out
      cp -r * "$out/"
      mkdir -p "$out/lua/custom"
      cp -r ${custom}/* "$out/lua/custom/"
    '';

    meta = {
      description = "NvChad";
      homepage = "https://github.com/NvChad/NvChad";
      license = lib.licenses.gpl3;
      maintainers = with lib.maintainers; [maintainers.itm154];
    };
  })
