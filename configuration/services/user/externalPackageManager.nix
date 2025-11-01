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

  # === 3. 服务：ll-cli 自动更新（00:05）===
  systemd.services.llcli-nightly-upgrade = {
    description = "Nightly ll-cli Upgrade";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.linyaps}/bin/ll-cli upgrade";
      User = "root";
      Nice = 19;
      IOSchedulingClass = "idle";
    };
  };

  # === 5. Timer：分别触发两个更新 ===
  systemd.timers.flatpak-nightly-upgrade = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 00:00:00";
      Persistent = true;
      Unit = "flatpak-nightly-upgrade.service";
    };
  };

  systemd.timers.llcli-nightly-upgrade = {
    wantedBy = [ "timers.target" ];
    timerConfig = {
      OnCalendar = "*-*-* 00:05:00";
      Persistent = true;
      Unit = "llcli-nightly-upgrade.service";
    };
  };
}
