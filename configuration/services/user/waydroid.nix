{
  config,
  pkgs,
  ...
}:

{
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };

  environment.systemPackages = with pkgs; [
    waydroid-helper
  ];

  fileSystems."/var/lib/waydroid" = {
    device = config.fileSystems."/data".device;
    fsType = config.fileSystems."/data".fsType;
    options = [
      "subvol=DATA/WayDroid"
      "compress=zstd:6"
    ];
  };
}
