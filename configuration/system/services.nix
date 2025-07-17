{ config, lib, pkgs, ... }:
{
  services = {
    pipewire = lib.mkForce {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };
    pulseaudio.enable = false;

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    dbus.apparmor = "enabled";
    xserver.excludePackages = [ pkgs.xterm ];

    usbguard.dbus.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    accounts-daemon.enable = true;

    envfs.enable = true;
  };
}
