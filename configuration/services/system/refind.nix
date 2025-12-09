{
  pkgs,
  ...
}:

{
  boot.loader.refind = {
    enable = true;
    maxGenerations = 10;
    additionalFiles = {
      "efi/memtest86/memtest86.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";
    };
  };
}
