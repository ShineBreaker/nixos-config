{
  pkgs,
  ...
}:

{
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
        font = "monospace:size=10";
        icons-enabled = "no";
        layer = "overlay";
        line-height = "16";
        terminal = "${pkgs.alacritty}/bin/alacritty";
      };
      colors = {
        background = "ffffffcc";

        text = "000000ff";
        prompt = "0f4b6eff";
        input = "343B58ff";
        match = "8c4351ff";

        selection = "343b58cc";
        selection-text = "ffffffff";
        selection-match = "f7768eff";

        border = "#00897Bff";
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
      background-color = "#ffffff95";
      width = 300;
      height = 500;
      padding = 10;
      margin = "10,10,10,10";
      border-size = 6;
      border-color = "#00897B";
      border-radius = 28;
      font = "Sans 10";
      text-color = "#000000";
      icons = 1;
      icon-path = "~/.nix-profile/share/icons/Papirus";
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
      
      "mode=do-not-disturb" = {
        invisible = 1;
      };
    };
  };

  programs.niriswitcher = {
    enable = true;
    settings = {
      keys = {
        modifier = "Alt";
        switch = {
          next = "Tab";
          prev = "Shift+Tab";
        };
      };
      appearance = {
        system_theme = "light";
        icon_size = 48;
      };
    };
  };

}
