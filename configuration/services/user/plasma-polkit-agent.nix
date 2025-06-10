{config, pkgs, ...}:
{
  environment.systemPackages = [ pkgs.kdePackages.polkit-kde-agent-1 ];

  security.polkit.enable = true;
  
  systemd.user.services = {
    plasma-polkit-agent = {
      description = "plasma-polkit-agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
  };

}