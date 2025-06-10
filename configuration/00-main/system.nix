{ config, ... }:

{
  imports =
    [
      ../system/hardware-configuration.nix
      ../system/boot.nix
      ../system/user.nix
      ../system/fonts.nix
      ../system/hardware.nix
      ../system/i18n.nix
      ../system/services.nix
      ../system/security.nix
      ../system/zramSwap.nix
      ../system/install-system.nix
    ];

  networking.hostName = "BrokenShine-Desktop";
  
  system = {
    stateVersion = "21.11";
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
} 
