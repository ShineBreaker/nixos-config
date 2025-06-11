{ config, ... }:

{
  xdg.configFile = {
      ".nix-channels".source = ../home/dotfiles/.nix-channels;
      ".default-wapplaper.png".source = ../home/dotfiles/.default-wapplaper.png;
      
      "waybar/config".source = ../home/dotfiles/waybar-config;
      "waybar/style.css".source = ../home/dotfiles/waybar-style.css;
      "niri/config.kdl".source = ../home/dotfiles/niri-config.kdl;
      "mako/config".source = ../home/dotfiles/mako-config;
  };
}