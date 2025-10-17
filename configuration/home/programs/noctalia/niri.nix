{
  ...
}:

{
  programs.niri.settings = {
    spawn-at-startup = [

      {
        argv = [
          "noctalia-shell"
        ];
      }

      {
        argv = [
          "noctalia-shell"
          "ipc"
          "call"
          "wallpaper"
          "random"
        ];
      }

    ];

    layer-rules = [
      {
        matches = [
          { namespace = "^quickshell-overview$"; }
        ];
        place-within-backdrop = true;
      }
    ];

    debug = {
      honor-xdg-activation-with-invalid-serial = true;
    };

    binds = {

      "Mod+Ctrl+R" = {
        hotkey-overlay.title = "随机壁纸";
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "wallpaper"
          "random"
        ];
      };

      "Mod+C" = {
        hotkey-overlay.title = "打开剪切板";
        repeat = false;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "clipboard"
        ];
      };

      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "launcher"
          "toggle"
        ];
      };

      "Super+Alt+L" = {
        hotkey-overlay.title = "锁屏";
        repeat = false;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "lockScreen"
          "toggle"
        ];
      };

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "increase"
        ];
      };

      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "decrease"
        ];
      };

      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "volume"
          "muteOutput"
        ];
      };

      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "decrease"
        ];
      };

      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn = [
          "noctalia-shell"
          "ipc"
          "call"
          "brightness"
          "increase"
        ];
      };
    };
  };
}
