{
  config,
  pkgs,
  lib,
  ...
}:

{
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
        font = "WenQuanYi Micro Hei Mono:size=10";
        icons-enabled = "no";
        layer = "overlay";
        line-height = "16";
        terminal = "${pkgs.alacritty}/bin/alacritty";
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
  
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      sort = "-time";
      layer = "overlay";
      background-color = "#32323295";
      width = 300;
      height = 500;
      padding = 10;
      margin = "10,10,10,10";
      border-size = 0;
      border-color = "#285577";
      border-radius = 5;
      font = "WenQuanYi Micro Hei 10";
      icons = 1;
      icon-path = "~/.nix-profile/share/icons/Papirus-Dark";
      max-icon-size = 64;
      default-timeout = 5000;
      ignore-timeout = 1;

      "urgency=high" = {
        border-color = "#bf616a";
        default-timeout = 0;
      };

      "category=mpd" = {
        default-timeout = 2000;
        group-by = "category";
      };
    };
  };
  
  services.polkit-gnome.enable = true;
  
}