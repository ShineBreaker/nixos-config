{ config, pkgs, lib, ... }:
{
  services = {
    syncthing = {
        enable = true;
        group = "users";
        user = "brokenshine";
        dataDir = "/home/brokenshine/Documents";
        configDir = "/home/brokenshine/.config/syncthing";
    };
  };

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services.syncthing.settings.gui = {
    user = "brokenshine";
    password = "114514";
  };

}
