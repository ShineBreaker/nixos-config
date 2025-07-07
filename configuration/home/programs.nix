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
    hmcl

    krita
    gimp3-with-plugins
    nomacs
    vlc

    coppwr
    wl-clicker
    bleachbit
    mission-center
    peazip

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

  programs.alacritty = {
    enable = true;
    theme = "tokyo_night";
    settings = {
      window.decorations = "None";
      window.opacity = 0.8;
      window.blur = true;

      cursor.style = "Beam";
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
