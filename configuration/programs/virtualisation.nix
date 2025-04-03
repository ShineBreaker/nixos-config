{ config, pkgs, libs, ... }:
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
        packages = [(pkgs.OVMF.override {
          secureBoot = true;
          tpmSupport = true;
        }).fd];
      };
    };
  };

  programs.virt-manager.enable = true;

  # virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableKvm = false;
  # virtualisation.virtualbox.host.addNetworkInterface = true;

  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [ distrobox boxbuddy ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };

}
