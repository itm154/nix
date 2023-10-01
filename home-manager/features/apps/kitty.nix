{ config, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    extraConfig = with config.colorScheme.colors; ''
      foreground              #CDD6F4
      background              #1E1E2E
      selection_foreground    #1E1E2E
      selection_background    #F5E0DC
      cursor                  #F5E0DC
      cursor_text_color       #1E1E2E
      active_border_color     #B4BEFE
      inactive_border_color   #6C7086
      bell_border_color       #F9E2AF
      active_tab_foreground   #11111B
      active_tab_background   #f38ba8
      inactive_tab_foreground #CDD6F4
      inactive_tab_background #181825
      tab_bar_background      #11111B
      mark1_foreground #1E1E2E
      mark1_background #B4BEFE
      mark2_foreground #1E1E2E
      mark2_background #CBA6F7
      mark3_foreground #1E1E2E
      mark3_background #74C7EC
      color0 #45475A
      color8 #585B70
      color1 #F38BA8
      color9 #F38BA8
      color2  #A6E3A1
      color10 #A6E3A1
      color3  #F9E2AF
      color11 #F9E2AF
      color4  #89B4FA
      color12 #89B4FA
      color5  #F5C2E7
      color13 #F5C2E7
      color6  #94E2D5
      color14 #94E2D5
      color7  #BAC2DE
      color15 #A6ADC8

      font_family JetBrains Mono Nerd Font
      font_size 16.0
      enable_audio_bell no

      tab_bar_min_tabs 1
      tab_bar_edge bottom
      tab_bar_style fade
      tab_powerline_style slanted
      tab_title_template {title}{' :{}:'.format(num_windows) if num_windows > 1 else }

      map kitty_mod+k next_tab
      map kitty_mod+j previous_tab
      map kitty_mod+t new_tab
      map kitty_mod+q close_tab
      map cmd+w close_tab
    '';
  };
}
