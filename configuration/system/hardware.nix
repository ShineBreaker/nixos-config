{ config, pkgs, ... }:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    enableAllFirmware = true;
    enableRedistributableFirmware = true;

    opentabletdriver = {
      enable = true;
      daemon.enable = true;
      blacklistedKernelModules = [
        "hid-uclogic"
        "wacom"
      ];
    };

  };
}
