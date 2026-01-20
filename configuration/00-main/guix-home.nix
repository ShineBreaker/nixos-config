{ config, pkgs, ... }:

{
  imports = [
    ../home/file.nix

    ../home/programs/Entertain/00-default.nix
    ../home/programs/Essentials/wps-office/default.nix
  ];

  home.username = "brokenshine";
  home.homeDirectory = "/home/brokenshine";
  home.stateVersion = "25.11"; # Please read the comment before changing.

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    (libreoffice.overrideAttrs {
      variant = "fresh";
      withHelp = false;
      kdeIntegration = false;
      withJava = false;

      langs = [
        "en-GB"
        "en-US"
        "zh-CN"
      ];

      noto-fonts = sarasa-gothic;
      noto-fonts-lgc-plus = sarasa-gothic;
      noto-fonts-cjk-sans = sarasa-gothic;
    })

    obsidian
    gimp3-with-plugins

    (qq.override {
      commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    })
    wechat
    telegram-desktop
  ];
}
