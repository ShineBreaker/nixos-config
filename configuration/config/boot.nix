{ config, lib, pkgs, ... }:
{
  boot = {
    enableContainers = false;

    kernelPackages = pkgs.linuxPackages_xanmod;

    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;
    };

    loader = {
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };

    kernelParams = [ "nohibernate" ]; 
    
    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };
  };
}
