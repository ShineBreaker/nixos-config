{ config, ... }:

{
  imports = [
    ../system/boot.nix
    ../system/fonts.nix
    ../system/hardware.nix
    ../system/hardware-configuration.nix
    ../system/i18n.nix
    ../system/install-system.nix
    ../system/security.nix
    ../system/services.nix
    ../system/swap.nix
    ../system/user.nix
  ];

  networking.hostName = "BrokenShine-Desktop";

  system = {
    stateVersion = "21.11";
    autoUpgrade.channel = "https://mirrors.ustc.edu.cn/nix-channels/nixos-unstable";
  };
}
