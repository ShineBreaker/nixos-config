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

  programs.nm-applet.enable = true;

  environment.systemPackages = [
    pkgs.nmgui
  ];
}
