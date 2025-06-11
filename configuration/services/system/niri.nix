{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    nemo-with-extensions
    alacritty
    mate.engrampa
    pavucontrol
    gtklock
    waypaper
    waybar
    xwayland-run
    cage
    fuzzel
    brightnessctl
  ];

  programs.xwayland.enable = true;
  programs.niri.enable = true;

  security.pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";

  services = {
    gnome.gnome-keyring.enable = true;
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gvfs.enable = true;
    seatd.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
      extraPortals = lib.mkForce [
        pkgs.xdg-desktop-portal-gnome
        pkgs.xdg-desktop-portal-gtk
      ];
    };
    autostart.enable = true;
  };

}
