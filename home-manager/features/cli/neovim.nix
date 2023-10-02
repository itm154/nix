{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  xdg.configFile."nvim" = {
    source = "${pkgs.nvchad}";
  };
}
