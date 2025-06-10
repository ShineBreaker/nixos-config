{ config, ... }:

{
  imports = [
    ../services/system/connman.nix
    # ../services/system/sudo.nix
    ../services/system/doas.nix
    ../services/system/fish.nix
    ../services/system/grub.nix
    ../services/system/nix.nix
    ../services/system/zfs.nix
    ../services/system/plymouth.nix
    ../services/system/gnupg.nix
    ../services/system/proxy.nix
    ../services/system/tlp.nix
    ../services/system/others.nix

    ../services/system/niri.nix
    ../services/system/fcitx5.nix
    ../services/system/greetd.nix
    ../services/system/qt6ct.nix

    ../services/user/flatpak.nix
    ../services/user/virtualisation.nix
    ../services/user/steam.nix
    ../services/user/java.nix
    ../services/user/firefox.nix

    ../services/user/swaybg.nix
    ../services/user/waybar.nix
    ../services/user/mako.nix
    ../services/user/xwayland-satellite.nix
    ../services/user/poweralertd.nix

  ];
  
  nixpkgs.config.permittedInsecurePackages = [

  ];

}
