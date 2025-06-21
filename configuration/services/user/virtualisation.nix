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
      runAsRoot = true;
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

  environment.systemPackages = with pkgs; [
    distrobox
    virglrenderer
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

}
