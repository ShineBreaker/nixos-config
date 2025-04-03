{ config, pkgs, lib, ... }:
{
  dconf.settings = {
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = with pkgs.gnomeExtensions; [
        gtk4-desktop-icons-ng-ding.extensionUuid
        user-themes.extensionUuid
        caffeine.extensionUuid
        appindicator.extensionUuid
        system-monitor.extensionUuid
        allow-locked-remote-desktop.extensionUuid
        xwayland-indicator.extensionUuid
        removable-drive-menu.extensionUuid
        dash-to-dock.extensionUuid
        clipboard-indicator.extensionUuid
        arcmenu.extensionUuid
        just-perfection.extensionUuid
        gsconnect.extensionUuid
        blur-my-shell.extensionUuid
        add-to-desktop.extensionUuid
      ];
    };
  };
}
