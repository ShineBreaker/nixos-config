{ config, pkgs, lib, ... }:

{
  imports =
    [
      ./input/ibus.nix
      ./services/networkmanager.nix
      ./services/qt6ct.nix
      ./services/gdm.nix
    ];

  services = {
    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    xserver = {
      desktopManager.gnome.enable = true;
    };
  };

  programs.seahorse.enable = true;
  programs.firefox.nativeMessagingHosts.packages =with pkgs; [ gnomeExtensions.gsconnect ];
  
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
  
  environment = {
    systemPackages = (with pkgs; [
      gnome-tweaks gnome-menus gradience
      blackbox-terminal networkmanagerapplet
    ]) ++ (with pkgs.pkgs.gnomeExtensions; [
        gtk4-desktop-icons-ng-ding
        user-themes
        caffeine
        appindicator
        system-monitor
        allow-locked-remote-desktop
        xwayland-indicator
        removable-drive-menu
        dash-to-dock
        clipboard-indicator
        arcmenu
        just-perfection
        gsconnect
        blur-my-shell
        add-to-desktop
    ]);
    gnome.excludePackages = (with pkgs.gnome; [
      gnome-characters 
      gnome-contacts
      gnome-logs
      gnome-maps
      gnome-music
      ]) ++ (with pkgs; [
      gnome-console
      gnome-tour
      geary
      baobab
      cheese
      epiphany
      gnome-font-viewer
      simple-scan
      totem
      yelp
      ]);
  };

  programs.kdeconnect.enable = true;
  programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
  programs.xwayland.enable = true;
}
