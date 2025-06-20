{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    wineWowPackages.stagingFull
    winetricks
    heroic
    lutris

    kdePackages.kdenlive

    mpv
    nomacs

    coppwr
    wl-clicker
    bleachbit

    gh
    linux-wallpaperengine

    qq
    telegram-desktop

    libreoffice-fresh
    vscode-fhs

    hmcl

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

  programs.keepassxc = {
    enable = true;
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "autumn_night_transparent";
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
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window.decorations = "None";
      window.opacity = 0.8;
    };
  };
}
