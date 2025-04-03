{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.brokenshine = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbuser" "uucp" "audio" "video" "libvirtd" "kvm" "input" "seat" ];
      useDefaultShell = true;
      hashedPassword = "$y$j9T$n/ymRgCEJ.hDWTIbs1zgy.$DScp0RP5zKv4AZJfEKy5nxQQqL0JZkoBHccbTh5xco1";
    };
  };

  security.pam.services.brokenshine.gnupg.enable = true;
}
