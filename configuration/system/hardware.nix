{
  ...
}:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    # 只启用必要的固件，而不是所有固件
    enableAllFirmware = false; # 改为false以避免包含不必要的固件
    enableRedistributableFirmware = true;
  };
}
