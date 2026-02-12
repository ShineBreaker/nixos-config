{ config, pkgs, ... }:

{
  imports = [
    ../home/programs/Essentials/wps-office/default.nix

    # ../home/programs/Entertain/00-default.nix
  ];

  targets.genericLinux.enable = true;

  home.username = "brokenshine";
  home.homeDirectory = "/home/brokenshine";
  home.stateVersion = "25.11";

  home.sessionVariables = {
    NIXOS_OZONE_WL = 1;
  };

  programs.home-manager.enable = true;

  xdg.enable = true;

  home.packages = with pkgs; [
    sarasa-gothic
    bibata-cursors

    gamemode
    gamescope

    postman

    (qq.override {
      commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    })
    wechat
    telegram-desktop
  ];
}
