{ config, pkgs, ... }:

{
  users = {
    mutableUsers = false;
    users.brokenshine = {
      isNormalUser = true;
      extraGroups = [ "wheel" "adbuser" "uucp" "audio" "video" "libvirtd" "kvm" "input" "seat" ];
      useDefaultShell = true;
      hashedPassword = "$y$j9T$RlITQjRdvQgkEU.lT41Q60$stBXd2yZX9egFSVViptJIbhiz2eWeM1yK/.tfOW5RN3";
    };
  };

  security.pam.services.brokenshine.gnupg.enable = true;
}
