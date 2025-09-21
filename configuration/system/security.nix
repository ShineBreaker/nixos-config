{ 
  ... 
}:

{
  security = {
    rtkit.enable = true;
    apparmor.enable = true;
  };

  services.dbus.apparmor = "enabled";

  networking = {
    nftables.enable = true;
    firewall.enable = true;
  };
}
