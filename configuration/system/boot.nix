{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot = {
    enableContainers = false;

    kernelPackages = pkgs.linuxPackages_cachyos-lto;

    kernel.sysctl = {
      "vm.max_map_count" = 2147483642;

      # 添加一些性能和安全相关的sysctl设置
      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "vm.swappiness" = 1; # 减少交换使用，提高SSD寿命
      "vm.vfs_cache_pressure" = 50; # 降低缓存压力，提高性能
    };

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false; # 禁用引导编辑器以提高安全性
      };
      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };

    tmp = {
      useTmpfs = true;
      cleanOnBoot = true;
    };

    extraModulePackages = with config.boot.kernelPackages; [
      v4l2loopback
    ];

    extraModprobeConfig = ''
      options v4l2loopback devices=1 video_nr=2 exclusive_caps=1 card_label="OBS Virtual Camera"
    '';

    supportedFilesystems = {
      btrfs = true;
      ext4 = true;
      ntfs = true;

      zfs = lib.mkForce false;
    };
  };
}
