{
  lib,
  pkgs,
  ...
}:

{
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    grub.enable = false;
    refind = {
      enable = true;
      maxGenerations = 10;
      additionalFiles = {
        "efi/memtest86/memtest86.efi" = "${pkgs.memtest86-efi}/BOOTX64.efi";
      };
      extraConfig = ''
        include themes/theme.conf
      '';
    };
  };
}
