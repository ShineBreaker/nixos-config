{
  pkgs,
  lib,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    pwvucontrol
    brightnessctl

    xwayland-satellite-unstable
    wl-clipboard
    libnotify
    cliphist

    labwc
  ];

  programs = {
    xwayland.enable = true;
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    gtklock.enable = true;
  };

  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";

  services = {
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gvfs.enable = true;
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
        xdg-desktop-portal-gnome
        xdg-desktop-portal-gtk
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
