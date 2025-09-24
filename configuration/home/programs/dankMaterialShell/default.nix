{ config, pkgs, lib, ... }:
{
  xdg.configFile =  {
    "niri/config.kdl".source = lib.mkForce ./dotfiles/config.kdl;
  };
  
  programs.dankMaterialShell = {
    enable = true;
  };

}
