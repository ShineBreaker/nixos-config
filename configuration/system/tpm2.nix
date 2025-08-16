{
  lib,
  ...
}:
{
  boot.initrd = {
    availableKernelModules =  [
    "tpm_tis"
    ];
    
    systemd = {
      enable = true;
      tpm2.enable = true;
    };
    
    luks.devices."root" = {
      device = lib.mkForce "/dev/disk/by-uuid/eb063fae-136d-476c-9b90-83d1056b513d";
      allowDiscards = true;
    };
  };
  
  security.tpm2.enable = true;
}