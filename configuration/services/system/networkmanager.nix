{ pkgs, ... }:
{
  networking = {
    modemmanager.enable = false;
    networkmanager = {
      enable = true;
      wifi = {
        macAddress = "random";
        backend = "iwd";
      };
    };
  };

  environment.systemPackages = [
    pkgs.nmgui
  ];
}
