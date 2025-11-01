{
  pkgs,
  ...
}:

{
  services = {
    linyaps.enable = true;
    flatpak.enable = true;
  };

  systemd.services.flatpak-nightly-upgrade = {
    description = "Nightly Flatpak Upgrade";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.flatpak}/bin/flatpak update -y";
      User = "root";
      Nice = 19;
      IOSchedulingClass = "idle";
    };
  };

  systemd.services.linyaps-nightly-upgrade = {
    description = "Nightly linyaps Upgrade";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.linyaps}/bin/ll-cli upgrade";
      User = "root";
      Nice = 19;
      IOSchedulingClass = "idle";
    };
  };

  systemd.timers.flatpak-nightly-upgrade = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 00:00:00";
      Persistent = true;
      Unit = "flatpak-nightly-upgrade.service";
    };
  };

  systemd.timers.linyaps-nightly-upgrade = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 00:05:00";
      Persistent = true;
      Unit = "linyaps-nightly-upgrade.service";
    };
  };
}
