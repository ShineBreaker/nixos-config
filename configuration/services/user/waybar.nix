{config, pkgs, ...}:
{
  programs.waybar.enable = true;
  programs.waybar.systemd.target = "graphical-session.target";
}