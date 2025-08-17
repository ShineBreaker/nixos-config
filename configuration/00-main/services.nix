{ ... }:

{
  imports = [
    ../services/system/connman.nix
    ../services/system/doas.nix
    ../services/system/fish.nix
    ../services/system/git.nix
    ../services/system/gnupg.nix
    ../services/system/greetd.nix
    # ../services/system/grub.nix
    ../services/system/hibernation.nix
    ../services/system/limine.nix
    ../services/system/niri.nix
    ../services/system/nix.nix
    ../services/system/nix-ld.nix
    ../services/system/others.nix
    ../services/system/plymouth.nix
    ../services/system/powerManagement.nix
    # ../services/system/sudo.nix
    # ../services/system/zfs.nix

    ../services/user/clash-verge.nix
    ../services/user/fcitx5.nix
    ../services/user/java.nix
    ../services/user/poweralertd.nix
    ../services/user/qt6ct.nix
    # ../services/user/sparkle.nix
    ../services/user/steam.nix
    ../services/user/sunshine.nix
    ../services/user/syncthing.nix
    ../services/user/virtualisation.nix
    ../services/user/wallpaper.nix
    # ../services/user/xwayland-satellite.nix

  ];

  nixpkgs.config.permittedInsecurePackages = [

  ];

}
