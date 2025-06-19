{
  config,
  pkgs,
  libs,
  ...
}:
{
  # imports = [ ./pci-passthrough.nix ];
  virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.libvirtd = {
    enable = true;

    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          pkgs.OVMFFull.fd
        ];
      };
      vhostUserPackages = with pkgs; [ virtiofsd ];
    };
  };

  programs.virt-manager.enable = true;

  boot.extraModprobeConfig = "options kvm_intel nested=1";

  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    distrobox
    gnome-boxes
    virglrenderer
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

}
