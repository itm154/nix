{ config, pkgs, ... }: 

{
  wayland.windowManager.hyprland.extraConfig = ''
  $mod = SUPER

  bind $mod, F, exec, firefox
  '';
}
