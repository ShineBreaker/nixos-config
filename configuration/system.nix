{ config, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./config/boot.nix
      ./config/fonts.nix
      ./config/hardware.nix
      ./config/i18n.nix
      ./config/services.nix
      ./config/security.nix
      ./config/zramSwap.nix
    ];

  networking.hostName = "nixos";
  
  system = {
    stateVersion = "21.11";
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
} 
