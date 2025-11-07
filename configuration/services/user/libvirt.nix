{
  config,
  pkgs,
  ...
}:

{
  # imports = [ ./pci-passthrough.nix ];
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      vhostUserPackages = with pkgs; [
        virtio-win
        virtiofsd
        virglrenderer
      ];
    };
  };

  programs.virt-manager.enable = true;

  users.users.brokenshine.extraGroups = [ "libvirtd" ];

  boot.extraModprobeConfig = "options kvm_intel nested=1";

  fileSystems."/var/lib/libvirt" = {
    device = config.fileSystems."/".device;
    fsType = config.fileSystems."/".fsType;
    options = [
      "subvol=DATA/LibVirt"
      "compress=zstd:6"
    ];
  };
}
