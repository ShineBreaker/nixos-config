{
  config,
  ...
}:

{
  security = {
    rtkit.enable = true;
    apparmor.enable = true;
    pam.services.audio = {
      text = ''
        @audio - rtprio 90          # maximum realtime priority
        @audio - memlock unlimited  # maximum locked-in-memory address space (KB)
      '';
    };
  };

  services = {
    dbus.apparmor = "enabled";
  };

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

  fileSystems."/var/lib/sbctl" = {
    device = config.fileSystems."/".device;
    fsType = config.fileSystems."/".fsType;
    options = [
      "subvol=DATA/sbctl"
      "compress=zstd:6"
    ];
  };
}
