{ config, pkgs, lib, ... }:
{
  xdg.configFile = {
    "niri/config.kdl".source = ./dotfiles/config.kdl;
  };
}
