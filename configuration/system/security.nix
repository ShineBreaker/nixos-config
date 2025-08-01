{ ... }:

{
  security = {
    rtkit.enable = true;
    apparmor.enable = true;
  };

  services.dbus.apparmor = "enabled";

  boot.initrd.luks.devices."root" = {
    keyFile = "/root.key";
  };

  boot.initrd.secrets = {
    "/root.key" = /var/lib/secrets/root.key;
  };
  
  networking.firewall = rec {
    allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    allowedUDPPortRanges = allowedTCPPortRanges;
  };
}
