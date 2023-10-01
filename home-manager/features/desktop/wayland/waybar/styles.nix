{
  ...
}:{
  with config.colorScheme.colors;
  ''
      

    /* Global */
    * {
    font-family: JetBrains Mono Nerd Font;
    font-weight: bold;
    }

  #custom-sep {
    font-size: 18px;
    color: @surface1;
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
    background-color: @base;
    opacity: 1;
    margin: 5px 0px 5px 0px;
    }

    window#waybar {
    background: rgba(30, 30, 46, 0.5);
    color: @base;
    }

    /* END-Global */

    /* Left */
  #workspaces {
    background: @base;
    border-radius: 12px;
    }

  #workspaces button {
    border-radius: 16px;
    color: @surface1;
    }

  #workspaces button.active {
    color: @pink;
    background-color: transparent;
    border-radius: 16px;
    }

  #workspaces button:hover {
    background-color: @pink;
    color: @base;
    border-radius: 100%;
    }

  #custom-cava {
    border-radius: 12px;
    color: @blue;
    }

  #custom-playerctl {
    border-radius: 12px;
    margin-left: 10px;
    padding-left: 10px;
    padding-right: 10px;
    color: @text;
    }

    /* END-Left */

    /* Middle */
  #clock {
    color: @sky;
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
    color: @lavender;
    border-radius: 10px 0 0 10px;
    }

  #memory {
    color: @mauve;
    }

  #pulseaudio {
    color: @peach;
    }

  #backlight {
    color: @yellow;
    border-radius: 0 10px 10px 0;
    margin-right: 10px;
    }

  #battery {
    color: @sapphire;
    border-radius: 10px 0 0 10px;
    }

  #battery.charging {
    color: @yellow;
    }

    @keyframes blink {
    to {
      color: @red;
    }
    }

  #battery.critical:not(.charging) {
    color: @red;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
    }

  #network {
    color: @green;
    border-radius: 0 10px 10px 0;
    margin-right: 10px;
    }

    /* END-Right */
  ''
}
