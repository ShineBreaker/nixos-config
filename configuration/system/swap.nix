{ ... }:
{
  zramSwap = {
    enable = true;
    priority = 100;
    swapDevices = 2;
  };

  swapDevices = [
    {
      device = "/swap/swapfile";
      size = 36864;
      priority = 0;

      encrypted = {
        enable = true;
        label = "root";
        keyFile = "/root.key";
        blkDev = "/dev/mapper/root";
      };
    }
  ];

}
