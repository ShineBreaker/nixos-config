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

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    dbus.apparmor = "enabled";
    xserver.excludePackages = [ pkgs.xterm ];

    thermald.enable = true;
  };
}
