{ config, ...}: {
  programs.lazygit = with config.colorScheme.colors; {
    enable = true;
    gui.theme = {
      lightTheme = false;
      activeBorderColor = [ "#${base0B}" "bold" ];
      inactiveBorderColor = [ "#${base05}" ];
      optionsTextColor = [ "#${base0D}" ];
      selectedLineBgColor = [ "#${base02}"];
      selectedRangeBgColor = [ "#${base02}" ];
      cherryPickedCommitBgColor = [ "#${base0C}" ];
      cherryPickedCommitFgColor = [ "#${base05}" ];
      unstagedChangesColor = [ "#${base08}" ];
    };
    gui = {
      showIcons = true;
      showBottomLine =  false;
    };
  };
}
