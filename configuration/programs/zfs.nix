{ config, lib, pkgs, ... }:
{
  boot.loader.grub = {
    enable = true;
    zfsSupport = true;
    efiSupport = true;
  };

  boot.supportedFilesystems = ["zfs" "vfat" "ntfs"];
  boot.kernelParams = [ "zfs.zfs_arc_max=2147483648" ];
  boot.extraModprobeConfig = ''
      options zfs l2arc_noprefetch=0 l2arc_write_boost=33554432 l2arc_write_max=16777216 zfs_arc_max=2147483648
    '';
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r zpool/RPOOL/NixOS/Clean@blank
  '';
  boot.zfs.extraPools = [ "zpool" ];
  boot.zfs.devNodes = "/dev/nvme0n1p6";
  
  networking.hostId = builtins.substring 0 8 (builtins.hashString "md5" config.networking.hostName);

  # nixos documentation recommends setting these to false
  boot = {
      zfs.forceImportAll = false;
      zfs.forceImportRoot = false;
  };
  
}
