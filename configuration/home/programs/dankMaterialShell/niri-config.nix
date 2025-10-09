{
  lib,
  ...
}:

{
  programs.niri.settings = {
    layout = {
      gaps = lib.mkForce 12;
      border  = {
        enable = lib.mkForce true;
      };
    };

    window-rules = [
      {
        matches = [{}];

        geometry-corner-radius = {
          top-left = 12.0;
          top-right = 12.0;
          bottom-left = 12.0;
          bottom-right = 12.0;
        };

        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];

    binds = {
      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [ "dms" "ipc" "call" "spotlight" "toggle" ];
      };
    };
  };
}
