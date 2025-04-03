{ config, ... }:
{
  zramSwap = {
    enable = true;
    priority = 10;
    swapDevices = 2;
  };
}
