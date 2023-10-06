{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extrasl; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };
}
