{ config, pkgs, lib, ... }:
{
  xdg.dataFile = {
    "fcitx5/rime/default.custom.yaml".source = ./dotfiles/default.custom.yaml;
  };
}
