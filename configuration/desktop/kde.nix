{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./input/fcitx5.nix
      ./services/networkmanager.nix
      ./services/sddm.nix
    ];

  services = {
    desktopManager.plasma6.enable = true;
  };

  qt.platformTheme = "kde";
  qt.style = "kvantum";

  environment.systemPackages = with pkgs; [
    kate kdePackages.sddm-kcm kdePackages.discover
    kdePackages.qtstyleplugin-kvantum libsForQt5.qtstyleplugin-kvantum
  ];

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
  oxygen
  ];

  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    chromium = {
      enablePlasmaBrowserIntegration = true;
    };
  };

}
