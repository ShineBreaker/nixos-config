{ config, ... }:

{
  xdg.configFile = {    
      "waybar/config.jsonc".source = ../home/dotfiles/waybar-config.jsonc;
      "waybar/style.css".source = ../home/dotfiles/waybar-style.css;

      "niri/config.kdl".source = ../home/dotfiles/niri-config.kdl;
  };
}