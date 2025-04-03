{ config, ... }:
{
  services = {
    xserver = {
     enable = true;
      desktopManager.xterm.enable = false;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
