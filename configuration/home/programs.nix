{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    protonup-rs
    protontricks
    mangohud
    mangojuice

    heroic
    (hmcl.override {
      hmclJdk = zulu17;
      minecraftJdks = [
        graalvm-ce
        zulu8
        zulu
      ];
    })

    gimp3-with-plugins
    krita
    
    ffmpeg-full
    imagemagick
    
    nomacs
    mpv

    coppwr
    mission-center
    qtscrcpy

    qq
    wechat-uos
    telegram-desktop
    thunderbird

    onlyoffice-desktopeditors
    lapce
    nil

    adwaita-icon-theme
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
      obs-vkcapture
      wlrobs
    ];
  };

  programs.keepassxc.enable = true;

  services.pass-secret-service.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = lib.getExe pkgs.nixfmt-rfc-style;
      }
    ];
    themes = {
      tokyonight_transparent = {
        "inherits" = "tokyonight";
        "ui.background" = { };
        "ui.text" = { };
        "ui.help" = { };
        "ui.menu" = { };
        "ui.statusline" = { };
      };
    };
  };


  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    languagePacks = [ "zh-CN" ];
    nativeMessagingHosts = [ pkgs.keepassxc ];
  };

  programs.firefoxpwa.enable = true;
}
