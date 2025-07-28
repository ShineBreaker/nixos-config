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
}
