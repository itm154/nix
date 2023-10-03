{config, ...}: {
  programs.waybar = {
    enable = true;
    settings = {
      mainbar = {
        layer = "top";
        modules-left = ["clock" "custom/cava" "custom/playerctl"];
        modules-center = ["hyprland/workspaces"];
        modules-right = [
          "tray"
          "cpu"
          "memory"
          "custom/sep"
          "pulseaudio"
          "backlight"
          "battery"
          "network"
        ];
        custom-sep = {
          format = "󰇙";
          tooltip = false;
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
          format = "{icon}";
          on-click = "activate";
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            sort-by-number = true;
          };
        };

        "custom/playerctl" = {
          format = "{icon}  <span>{}</span>";
          return-type = "json";
          max-length = 35;
          exec = ''
            playerctl -a metadata --format '{"text": "{{artist}} ~ {{markup_escape(title)}}", "tooltip": "{{playerName}} : {{markup_escape(title)}}", "alt": "{{status}}", "class": "{{status}}"}' -F'';
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          format-icons = {
            Playing = "<span foreground='#a6e3a1'></span>";
            Paused = "<span foreground='#f38ba8'></span>";
          };
          tooltip = false;
        };

        "custom/cava" = {
          exec = ''
            is_cava_ServerExist=`ps -ef|grep -m 1 cava|grep -v "grep"|wc -l`
            if [ "$is_cava_ServerExist" = "0" ]; then
                echo "cava_server not found" > /dev/null 2>&1
                #	exit;
            elif [ "$is_cava_ServerExist" = "1" ]; then
                killall cava
            fi

            exec cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
          '';
          format = "{}";
          layer = "below";
          output = "all";
          tooltip = false;
        };
        clock = {
          format = "  {:%I:%M %p} ";
          format-alt = "  {:%A 󰇙 %d %B} ";
          tooltip = false;
        };
        tray = {
          icon-size = 21;
          spacing = 10;
          tooltip = false;
        };
        cpu = {
          format = "󰻠 {usage}%";
          tooltip = false;
        };
        memory = {
          format = " {used:0.1f}G";
          tooltip = false;
        };
        pulseaudio = {
          scroll-step = 5;
          format = "{icon} {volume}";
          format-muted = "󰝟 ";
          format-bluetooth = "{icon} {volume}";
          format-bluetooth-muted = "󰝟 ";
          format-icons = {default = ["" "" " "];};
          on-click-middle = "amixer -D pulse set Master 1+ toggle";
          on-scroll-up = "pamixer -i 5";
          on-scroll-down = "pamixer -d 5";
          tooltip = false;
        };
        backlight = {
          scroll-step = 5;
          format = "{icon} {percent}";
          format-icons = ["" "" "" "" "" "" "" "" ""];
          tooltip = false;
        };
        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-good = "󰂃 {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          tooltip = false;
        };
        network = {
          format-linked = "{ifname} (No IP) ";
          format-wifi = " ";
          format-ethernet = "󰈀 ";
          format-disabled = "󰌙 ";
          format-disconnected = "󰖪 ";
          format-alt = "{essid}: {ipaddr}/{cidr}";
          tooltip = false;
        };
      };
    };

    style = with config.colorScheme.colors; ''
      /* Global */
      * {
        font-family: JetBrains Mono Nerd Font;
        font-weight: bold;
      }

      #custom-sep {
        font-size: 18px;
        color: #${base03};
      }

      #custom-sep,
      #custom-playerctl,
      #custom-cava,
      #workspaces,
      #clock,
      #cpu,
      #memory,
      #pulseaudio,
      #backlight,
      #network,
      #battery,
      #tray {
        padding: 5px 10px;
        border-style: solid;
        background-color: #${base00};
        opacity: 1;
        margin: 5px 0px 5px 0px;
      }

      window#waybar {
        background: rgba(30, 30, 46, 0.5);
        color: #${base00};
      }

        /* END-Global */

        /* Left */
      #workspaces {
        background: #${base00};
        border-radius: 12px;
      }

      #workspaces button {
        border-radius: 16px;
        color: #${base03};
      }

      #workspaces button.active {
        color: #${base06};
        background-color: transparent;
        border-radius: 16px;
      }

      #workspaces button:hover {
        background-color: #${base06};
        color: #${base00};
        border-radius: 100%;
      }

      #custom-cava {
        border-radius: 12px;
        color: #${base0D};
      }

      #custom-playerctl {
        border-radius: 12px;
        margin-left: 10px;
        padding-left: 10px;
        padding-right: 10px;
        color: #${base05};
      }

        /* END-Left */

        /* Middle */
      #clock {
        color: #${base0C};
        border-radius: 12px;
        margin-left: 10px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
      }

        /* END-Middle */

        /* Right */
      #tray {
        border-radius: 12px;
        margin-right: 10px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #cpu {
        color: #${base07};
        border-radius: 10px 0 0 10px;
      }

      #memory {
        color: #${base0E};
      }

      #pulseaudio {
        color: #${base09};
      }

      #backlight {
        color: #${base0A};
        border-radius: 0 10px 10px 0;
        margin-right: 10px;
      }

      #battery {
        color: #${base06};
        border-radius: 10px 0 0 10px;
      }

      #battery.charging {
        color: #${base0A};
      }

        @keyframes blink {
        to {
          color: #${base08};
        }
      }

      #battery.critical:not(.charging) {
        color: #${base08};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      #network {
        color: #${base0B};
        border-radius: 0 10px 10px 0;
        margin-right: 10px;
      }

        /* END-Right */
    '';
  };
}
