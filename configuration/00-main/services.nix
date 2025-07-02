{ config, ... }:

{
  imports = [
    ../services/system/connman.nix
    # ../services/system/sudo.nix
    ../services/system/doas.nix
    ../services/system/fish.nix
    # ../services/system/grub.nix
    ../services/system/nix.nix
    # ../services/system/zfs.nix
    ../services/system/plymouth.nix
    ../services/system/gnupg.nix
    ../services/system/proxy.nix
    ../services/system/powerManagement.nix
    ../services/system/hibernation.nix
    ../services/system/others.nix

    ../services/system/niri.nix
    ../services/user/fcitx5.nix
    ../services/system/greetd.nix
    ../services/user/qt6ct.nix

    ../services/user/flatpak.nix
    ../services/user/virtualisation.nix
    ../services/user/steam.nix
    ../services/user/java.nix
    ../services/user/firefox.nix
    ../services/user/nix-ld.nix
    ../services/user/syncthing.nix

    ../services/user/swaybg.nix
    ../services/user/mako.nix
    ../services/user/xwayland-satellite.nix
    ../services/user/poweralertd.nix
    ../services/user/polkit-agent.nix

  ];

  nixpkgs.config.permittedInsecurePackages = [

  ];

}
