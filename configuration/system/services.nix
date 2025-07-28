{ 
  lib, 
  pkgs, 
  ... 
}:

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

    scx ={
      enable = false;
      package = pkgs.scx_git.full;
      scheduler = "scx_rusty";
    };
    
    dbus.apparmor = "enabled";
    xserver.excludePackages = [ pkgs.xterm ];
    flatpak.enable = true;

    usbguard.dbus.enable = true;
    udisks2.enable = true;
    upower.enable = true;
    accounts-daemon.enable = true;

    envfs.enable = true;
  };
}
