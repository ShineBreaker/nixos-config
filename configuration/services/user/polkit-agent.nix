{config, pkgs, ...}:
{
  environment.systemPackages = [ pkgs.polkit_gnome ];

  security.polkit.enable = true;
  
  systemd.user.services = {
    polkit_gnome = {
      description = "polkit for niri.";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
  };

}