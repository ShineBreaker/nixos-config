{
  ...
}:

{
  boot = {
    plymouth = {
      enable = true;
      tpm2-totp.enable = true;
    };

    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };
}
