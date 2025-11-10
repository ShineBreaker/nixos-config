{
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    cliphist
  ];

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
    };
  };

  programs.niri.settings = {
    spawn-at-startup = [
      { sh = "wl-paste --watch cliphist store &"; }
    ];
    binds = {
      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [ "fuzzel" ];
      };
      "Mod+C" = {
        hotkey-overlay.title = "打开剪切板";
        repeat = false;
        action.spawn = [
          "sh"
          "-c"
          "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"
        ];
      };
    };
  };
}
