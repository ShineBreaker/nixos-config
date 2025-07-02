{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    wineWowPackages.waylandFull
    winetricks
    q4wine
    icoutils

    heroic
    prismlauncher
    hmcl

    krita
    gimp3-with-plugins
    nomacs

    coppwr
    wl-clicker
    bleachbit
    mission-center

    qq
    wechat-uos
    telegram-desktop
    thunderbird

    libreoffice-fresh
    vscode-fhs

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

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "after-resume";
        command = "${pkgs.gtklock}/bin/gtklock";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.systemd}/bin/systemctl suspend";
      }
    ];
  };
}
