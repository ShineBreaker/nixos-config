{config, pkgs, ...}:
{
  environment.systemPackages = [ pkgs.mako ];
  
  systemd.user.services = {
    mako = {
      description = "Lightweight Wayland notification daemon.";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          ExecStart = "${pkgs.mako}/bin/mako";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
  };

}