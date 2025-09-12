{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    tpm2-tools
    tpm2-tss
  ];
  
  boot.initrd = {
    availableKernelModules =  [
    "tpm_tis"
    ];
    
    systemd = {
      enable = true;
      tpm2.enable = true;
      storePaths = [
        "${config.boot.initrd.systemd.package}/lib/systemd/systemd-tpm2-setup"
        "${config.boot.initrd.systemd.package}/lib/systemd/system-generators/systemd-tpm2-generator"
      ];
    };
    
    luks.devices."root" = {
      allowDiscards = true;
    };
  };
  
  security.tpm2.enable = true;
}