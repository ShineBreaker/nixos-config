{ config, pkgs, ... }:

{
  users = {
    users.nixos = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbuser" "uucp" "audio" "video" "libvirtd" "kvm" "input" "seat" ];
      useDefaultShell = true;
    };
  };

  security.pam.services.nixos.gnupg.enable = true;
}
