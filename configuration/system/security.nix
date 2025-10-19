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

    firewall = {
      enable = true;
      checkReversePath = false;

      # needed fot kdeconnect.
      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];
    };

    hosts."127.0.0.1" = [
      # Block this domain to prevent QQ from auto-updating.
      "qqpatch.gtimg.cn"
    ];
  };
}
