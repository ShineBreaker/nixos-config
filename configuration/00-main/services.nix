{ ... }:

{
  imports = [
    ../services/system/beesd.nix
    # ../services/system/connman.nix
    # ../services/system/doas.nix
    ../services/system/fish.nix
    ../services/system/fprintd.nix
    ../services/system/git.nix
    ../services/system/gnupg.nix
    # ../services/system/greetd.nix
    # ../services/system/grub.nix
    ../services/system/limine.nix
    # ../services/system/ly.nix
    ../services/system/networkmanager.nix
    ../services/system/niri.nix
    ../services/system/nix.nix
    ../services/system/nix-ld.nix
    # ../services/system/opentabletdriver.nix
    ../services/system/others.nix
    ../services/system/plymouth.nix
    ../services/system/powerManagement.nix
    # ../services/system/sddm.nix
    ../services/system/sudo.nix
    # ../services/system/zfs.nix

    # ../services/user/clash-verge.nix
    ../services/user/fcitx5.nix
    ../services/user/java.nix
    ../services/user/poweralertd.nix
    ../services/user/sparkle.nix
    ../services/user/steam.nix
    ../services/user/sunshine.nix
    ../services/user/syncthing.nix
    ../services/user/virtualisation.nix
    # ../services/user/xwayland-satellite.nix

  ];

  nixpkgs.config.permittedInsecurePackages = [

  ];

}
