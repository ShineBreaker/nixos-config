{
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    limine = {
      enable = true;
      secureBoot.enable = true;
      maxGenerations = 10;
      extraConfig = "
        timeout: 3
        serial: yes
      ";
      extraEntries = "
        /Fedora
          protocol: efi
          path: boot():/EFI/fedora/shim.efi

        /Windows
          protocol: efi_chainload
          image_path: uuid(C432755D-2F67-448E-AB75-4255DA581DC0):/EFI/Microsoft/Boot/bootmgfw.efi\
      ";
    };
  };
}