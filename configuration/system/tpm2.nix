{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    tpm2-tools
    tpm2-tss
  ];

  boot.initrd = {
    availableKernelModules = [
      "tpm_tis"
    ];

    systemd.tpm2.enable = true;

    luks.devices."root" = {
      allowDiscards = true;
    };
  };

  security.tpm2 = {
    enable = true;
    abrmd.enable = true;
    pkcs11.enable = true;
    tctiEnvironment.enable = true;
  };

  users.users.brokenshine.extraGroups = [ "tss" ];
}
