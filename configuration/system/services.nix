{
  lib,
  pkgs,
  ...
}:

{
  system = {
    nixos-init.enable = false;
    etc.overlay.enable = false;
  };

  networking = {
    wireless = {
      enable = lib.mkForce false;
      iwd = {
        enable = lib.mkForce true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };

  services = {
    pipewire = {
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

    scx = {
      enable = true;
      package = pkgs.scx.full;
      scheduler = "scx_rusty";
    };

    xserver = {
      excludePackages = [ pkgs.xterm ];
      upscaleDefaultCursor = true;
    };

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    usbguard.dbus.enable = true;
    udisks2.enable = true;
    speechd.enable = lib.mkForce false;
    openntpd.enable = true;
    userborn.enable = false;
  };
}
