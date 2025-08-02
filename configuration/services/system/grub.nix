{ 
  lib, 
  ... 
}:

{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    grub = {
      enable = true;
      configurationName = "NixOS";
      device = "nodev";
      useOSProber = false;
      efiSupport = true;

      splashImage = null;
      backgroundColor = "#000000";
      timeoutStyle = "hidden";
    };
  };
}
