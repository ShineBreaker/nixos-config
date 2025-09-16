{ pkgs, ... }:
{
  networking = {
    modemmanager.enable = true;
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
