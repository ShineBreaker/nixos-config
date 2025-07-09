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

    gimp3-with-plugins
    geeqie
    vlc

    coppwr
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

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        icons-enabled = "no";
        terminal = "${pkgs.alacritty}/bin/alacritty";
        layer = "overlay";
      };
      colors = {
        background = "2c2c2ccc";

        text = "ffffffff";
        prompt = "4db6acff";
        input = "4db6acff";
        match = "f3777cff";

        selection = "383838cc";
        selection-text = "8fc3a2ff";
        selection-match = "f58e92ff";

        border = "#7fc8ffff";
      };
      border = {
        width = "6";
        radius = "28";
      };
    };
  };
}
