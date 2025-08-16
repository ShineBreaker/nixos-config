{ 
  ... 
}:

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
        blkDev = "/dev/disk/by-uuid/eb063fae-136d-476c-9b90-83d1056b513d";
      };
    }
  ];

}
