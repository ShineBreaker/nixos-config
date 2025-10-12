{
  lib,
  ...
}:

{
  programs.niri.settings = {
    environment = {
      DMS_DISABLE_MATUGEN = "1";
    };

    layout = {
      gaps = lib.mkForce 12;
    };

    layer-rules = [
      {
        matches = [
          { namespace = "r'^quickshell*.'"; }
        ];

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
