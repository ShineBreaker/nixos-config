{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    labwc

    wl-clipboard-rs
    libnotify
    cliphist
  ];

  programs = {
    xwayland.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri_git;
    };
    gtklock.enable = true;
  };

  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";

  services = {
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gnome.gnome-keyring.enable = lib.mkForce false;
    seatd.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config = {
        common = {
          default = [ "gnome" ];
          "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        };
      };
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "foot.desktop"
        ];
      };
    };
    autostart.enable = true;
    icons.fallbackCursorThemes = [ "Bibata-Modern-Classic" ];
  };

}
