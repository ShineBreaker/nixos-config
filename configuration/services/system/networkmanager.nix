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

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [ nmgui ];
}
