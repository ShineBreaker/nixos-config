{
  pkgs,
  lib,
  config,
  ...
}:

{
  home.packages = with pkgs; [
    swww
    mpvpaper
    waypaper

    socat
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile = {
    "waybar/config.jsonc".source = ./dotfiles/waybar-config.jsonc;

    "waybar/style.css".source = ./dotfiles/waybar-style-dark.css;
    # "waybar/style.css".source = ./dotfiles/waybar-style-light.css;
  };

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "monospace:size=10";
        icons-enabled = "no";
        layer = "overlay";
        line-height = "16";
        terminal = "foot";
      };
      border = {
        width = "4";
        radius = "12";
      };
      colors = {
        background = lib.mkForce "#282c34e5";
        selection = lib.mkForce "#545862cc";
      };
    };
  };

  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      background-color = lib.mkForce config.programs.fuzzel.settings.colors.background;
      sort = "-time";
      layer = "overlay";
      width = 300;
      height = 500;
      padding = 10;
      margin = "10,10,10,10";
      border-size = 3;
      border-radius = 10;
      icons = 1;
      icon-path = "~/.nix-profile/share/icons/Papirus";
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 1;

      "urgency=high" = {
        default-timeout = 0;
      };

      "category=mpd" = {
        default-timeout = 2000;
        group-by = "category";
      };

      "mode=do-not-disturb" = {
        invisible = 1;
      };
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors && ${pkgs.gtklock}/bin/gtklock -d";
      }
      {
        event = "unlock";
        command = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
      {
        event = "after-resume";
        command = "${pkgs.gtklock}/bin/gtklock -d";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.niri}/bin/niri msg action power-off-monitors && ${pkgs.gtklock}/bin/gtklock -d";
      }
    ];
  };

  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "waypaper" "--restore" ]; }
    ];
    window-rules = [
      {
        matches = [{}];

        geometry-corner-radius = {
          top-left = 0.0;
          top-right = 0.0;
          bottom-left = 0.0;
          bottom-right = 0.0;
        };

        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];
  };
}
