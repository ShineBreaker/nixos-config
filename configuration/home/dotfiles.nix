{ config, ... }:

{
  xdg.configFile = {    
      "waybar/config".source = ../home/dotfiles/waybar-config;
      "waybar/style.css".source = ../home/dotfiles/waybar-style.css;

      "niri/config.kdl".source = ../home/dotfiles/niri-config.kdl;
  };
}