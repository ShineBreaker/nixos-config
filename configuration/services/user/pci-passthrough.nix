{ 
  pkgs, 
  ... 
}:

{
  # CHANGE: intel_iommu enables iommu for intel CPUs with VT-d
  # use amd_iommu if you have an AMD CPU with AMD-Vi
  boot.kernelParams = [ "intel_iommu=on" ];

  # These modules are required for PCI passthrough, and must come before early modesetting stuff
  boot.kernelModules = [
    "vfio"
    "vfio_iommu_type1"
    "vfio_pci"
    "vfio_virqfd"
  ];

  # CHANGE: Don't forget to put your own PCI IDs here
  # boot.extraModprobeConfig ="options vfio-pci ids=8086:7d55";

  environment.systemPackages = with pkgs; [
    virt-manager
    qemu
    OVMF
    pciutils
  ];

  # CHANGE: add your own user here
  users.groups.libvirtd.members = [
    "root"
    "brokenshine"
  ];

  # CHANGE: use
  #     ls /nix/store/*OVMF*/FV/OVMF{,_VARS}.fd | tail -n2 | tr '\n' : | sed -e 's/:$//'
  # to find your nix store paths
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    nvram = [ "${pkgs.OVMF}/FV/OVMF.fd:${pkgs.OVMF}/FV/OVMF_VARS.fd" ]
  '';

  boot.initrd.services.udev.rules = ''
    SUBSYSTEM=="vfio", OWNER="root", GROUP="kvm"
  '';

  security.pam.loginLimits = [
    {
      domain = "@kvm";
      item = "memlock";
      type = "soft";
      value = "unlimited";
    }
    {
      domain = "@kvm";
      item = "memlock";
      type = "hard";
      value = "unlimited";
    }
    {
      domain = "@libvirt";
      item = "memlock";
      type = "soft";
      value = "unlimited";
    }
    {
      domain = "@libvirt";
      item = "memlock";
      type = "hard";
      value = "unlimited";
    }
  ];
}
