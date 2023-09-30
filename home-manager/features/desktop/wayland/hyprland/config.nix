{
  inputs,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    extraConfig = with config.colorScheme.colors;
    ''
      monitor=eDP-1, 1920x1080@60, 0x0, 1
      source=~/.config/hypr/mocha.conf

      env=QT_QPA_PLATFORM,wayland
      env=SDL_VIDEODRIVER,wayland

      general {
          gaps_in = 4
          gaps_out = 12
          border_size = 2
          col.active_border = ${base00}
          col.inactive_border = ${base00}
          layout = dwindle
      }

      input {
        kb_layout = us
          repeat_rate=50
          repeat_delay=180
          follow_mouse = 1

          touchpad {
            disable_while_typing=1
              tap-to-click=1
              natural_scroll = true
          }
        sensitivity = 0
          accel_profile = flat
      }

      decoration {
          rounding = 8
          inactive_opacity=0.8
          drop_shadow = yes
          shadow_range = 8
          shadow_render_power = 2
          col.shadow = ${base00}
          blur {
            enabled = true
            new_optimizations = true
            size = 4
            passes = 2
          }
      }

      misc {
        disable_hyprland_logo = 1
        disable_splash_rendering = 1
        animate_manual_resizes = false
        animate_mouse_windowdragging = false
        vfr = true
      }

      animations {
          enabled = true

          bezier = myBezier, 0.05, 0.9, 0.1, 1.05

          animation = windows, 1, 7, myBezier
          animation = windowsOut, 1, 7, default, popin 80%
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default
      }

      dwindle {
          pseudotile = true
          preserve_split = true
          # force_split = 2
      }

      master {
          new_is_master = true
      }

      gestures {
          workspace_swipe = true
      }

      windowrule = float,Rofi
      windowrule = tile,kitty
      windowrule = tile,spotify
      windowrule = fullscreen, wlogout
      windowrule = float, title:wlogout
      windowrule = fullscreen, title:wlogout
      windowrule = tile, title:KeyOverlay

      $mainMod = SUPER
      $shiftmod = SUPERSHIFT
      $ctrlmod = SUPERCTRL

      bind = $mainMod, Return, exec, kitty
      bind = $mainMod, E, exec, emacsclient -c -a 'emacs'
      bind = $mainMod, B, exec, firefox

      bind = $shiftmod, S, exec, grimblast --notify copysave area $HOME/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S_grim.png')
      bind = $shiftmod , A, exec, grimblast --notify copysave screen $HOME/Pictures/Screenshots/$(date +'%Y-%m-%d-%H%M%S_grim.png')
      bind = $mainMod, D, exec, $HOME/.config/rofi/launchers/type-2/launcher.sh
      bind = $mainMod, X, exec, wlogout

      bind = , XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
      bind = , XF86AudioRaiseVolume, exec, pamixer -i 5
      bind = , XF86AudioLowerVolume, exec, pamixer -d 5
      bind = , XF86AudioMute, exec, pactl set-sink-mute 0 toggle
      bind = , XF86AudioPlay, exec, playerctl play-pause
      bind = $mainMod, SPACE, exec, playerctl play-pause

      bind = $mainMod, Q, killactive
      bind = $mainMod, G, togglefloating,
      bind = $mainMod, M, fullscreen
      bind = $mainMod, S, pseudo,
      bind = $mainMod, V, togglesplit,

      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

      bind = $shiftmod, H, movewindow, l
      bind = $shiftmod, L, movewindow, r
      bind = $shiftmod, K, movewindow, u
      bind = $shiftmod, J, movewindow, d
      bind = $shiftmod, left, movewindow, l
      bind = $shiftmod, right, movewindow, r
      bind = $shiftmod, up, movewindow, u
      bind = $shiftmod, down, movewindow, d

      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $ctrlmod, K, workspace, e+1 # Next workspace
      bind = $ctrlmod, J, workspace, e-1 # Previous workspace

      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      bind = $shiftmod, W, exec, /home/itm154/.config/hypr/waybar.sh
    '';
  };
}
