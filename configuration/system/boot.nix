{
  pkgs,
  lib,
  ...
}:

{
  system = {
    etc.overlay.enable = false;
    nixos-init.enable = false;
  };

  boot = {
    enableContainers = false;
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-lts-lto;
    kernel.sysctl = {
      "fs.inotify.max_user_watches" = 524288;

      "vm.max_map_count" = 2147483642;
      "vm.compaction_proactiveness" = 0;
      "vm.vfs_cache_pressure" = 50;
      "vm.page_lock_unfairness" = 1;
      "vm.stat_interval" = 120;

      "net.core.default_qdisc" = "fq";
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_low_latency" = 1;
      "net.ipv4.tcp_fastopen" = 3;

      "kernel.numa_balancing" = 0;
      "kernel.sched_autogroup_enabled" = 1;
      "kernel.sched_child_runs_first" = 0;
    };

    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
        editor = false;
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

    initrd.systemd.enable = true;

    supportedFilesystems = {
      btrfs = true;
      ext4 = true;
      ntfs = true;

      zfs = lib.mkForce false;
    };
  };
}
