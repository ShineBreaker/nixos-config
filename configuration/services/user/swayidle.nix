{ config, pkgs, ... }:
{
  environment.systemPackages = [ pkgs.swayidle ];

  systemd.user.services = {
    swayidle = {
      description = "swayidle similarly does not provide a service, so we will also make our own.";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.swayidle}/bin/swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 'gtklock' before-sleep 'gtklock'";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

}
