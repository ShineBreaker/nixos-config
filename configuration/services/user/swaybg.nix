{ config, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.swaybg ];

  systemd.user.services = {
    swaybg = {
      description = "swaybg";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.swaybg}/bin/swaybg  -m fill -i '%h/.config/.default-wallpaper.png'";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

}
