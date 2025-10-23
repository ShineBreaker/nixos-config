{
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "fcitx5"
          "-d"
        ];
      }
      { argv = [ "sparkle" ]; }

      { sh = "wl-paste --watch cliphist store &"; }
    ];

    prefer-no-csd = true;

    hotkey-overlay = {
      skip-at-startup = true;
      hide-not-bound = true;
    };

    xwayland-satellite = {
      enable = true;
      path = lib.getExe pkgs.xwayland-satellite-unstable;
    };

    gestures.hot-corners.enable = false;

    screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d_%H-%M-%S.png";

    input = {
      mouse = {
        enable = true;
        accel-speed = 0.6;
        accel-profile = "flat";
      };
      touchpad = {
        enable = true;
        tap = true;
        dwt = true;
        natural-scroll = true;
      };
    };

    layout = {
      gaps = 6;

      center-focused-column = "on-overflow";
      always-center-single-column = true;

      preset-column-widths = [
        { proportion = 0.49995; }
        { proportion = config.programs.niri.settings.layout.default-column-width.proportion; }
        { proportion = 1.; }
      ];

      default-column-width = {
        proportion = 3. / 4.;
      };

      focus-ring = {
        enable = false;
        width = config.programs.niri.settings.layout.border.width;

        active = {
          gradient = {
            from = "#85c7d5";
            to = "#ddbc7d";
            angle = 45;
          };
        };

        inactive = {
          color = "#505050";
        };
      };

      border = {
        enable = false;
        width = 2;
      };

      shadow = {
        enable = true;
        softness = 4;
        spread = 0;
        offset = {
          x = 0;
          y = 0;
        };
        draw-behind-window = false;
        color = "#000000";
      };
    };

    switch-events = {
      lid-close.action.spawn = [ "niri msg action power-off-monitors" ];
      lid-open.action.spawn = [ "niri msg action power-on-monitors" ];
    };
  };

}
