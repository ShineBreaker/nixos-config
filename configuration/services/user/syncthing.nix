{ ... }:
{
  services = {
    syncthing = {
        enable = true;
        openDefaultPorts = true;
        group = "users";
        user = "brokenshine";
        dataDir = "/home/brokenshine";

        overrideDevices = false;
        overrideFolders = false;
    };
  };

  networking.firewall.allowedTCPPorts = [ 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];

  services.syncthing.settings.gui = {
    user = "brokenshine";
    password = "114514";
  };

}
