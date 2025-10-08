{
  pkgs,
  config,
  lib,
  ...
}:

{
  programs.niri.settings.binds = ''
  binds {
    Mod+Alt+Space   hotkey-overlay-title="显示提示"                            { show-hotkey-overlay; }
    Mod+Ctrl+R      hotkey-overlay-title="随机壁纸"                            { spawn "waypaper" "--random"; }

    Mod+T        hotkey-overlay-title="打开终端"      repeat=false  { spawn "foot"; }
    Mod+D        hotkey-overlay-title="打开搜索"      repeat=false  { spawn "fuzzel"; }
    Mod+C        hotkey-overlay-title="打开剪切板"    repeat=false  { spawn "sh" "-c" "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"; }
    Mod+Escape   hotkey-overlay-title="总览"          repeat=false  { toggle-overview; }
    Super+Alt+L  hotkey-overlay-title="锁屏"          repeat=false  { spawn "gtklock"; }

    XF86AudioRaiseVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
    XF86AudioLowerVolume allow-when-locked=true { spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
    XF86AudioMute        allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }
    XF86AudioMicMute     allow-when-locked=true { spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle"; }

    XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "set" "5%-"; }
    XF86MonBrightnessUp   allow-when-locked=true { spawn "brightnessctl" "set" "5%+"; }
	
    Mod+Q  hotkey-overlay-title="关闭窗口"   { close-window; }

    Mod+Left    hotkey-overlay-title="向左"   { focus-column-left; }
    Mod+Down    hotkey-overlay-title="向下"   { focus-window-down; }
    Mod+Up      hotkey-overlay-title="向上"   { focus-window-up; }
    Mod+Right   hotkey-overlay-title="向右"   { focus-column-right; }
    
    Mod+Tab        hotkey-overlay-title="开启窗口组"             { toggle-column-tabbed-display; }
    Mod+Ctrl+Tab   hotkey-overlay-title="将右侧窗口移入窗口组"   { consume-window-into-column; }
    Mod+Alt+Tab    hotkey-overlay-title="将窗口移出窗口组"       { expel-window-from-column; }

    Mod+Ctrl+Left    hotkey-overlay-title="左移窗口"     { move-column-left; }
    Mod+Ctrl+Down    hotkey-overlay-title="下移窗口"     { move-window-down; }
    Mod+Ctrl+Up      hotkey-overlay-title="上移窗口"     { move-window-up; }
    Mod+Ctrl+Right   hotkey-overlay-title="右移窗口"     { move-column-right; }
    Mod+Ctrl+F       hotkey-overlay-title="使窗口悬浮"   { toggle-window-floating; }

    Mod+Shift+Left  { focus-monitor-left; }
    Mod+Shift+Down  { focus-monitor-down; }
    Mod+Shift+Up    { focus-monitor-up; }
    Mod+Shift+Right { focus-monitor-right; }
    Mod+Shift+H     { focus-monitor-left; }
    Mod+Shift+J     { focus-monitor-down; }
    Mod+Shift+K     { focus-monitor-up; }
    Mod+Shift+L     { focus-monitor-right; }

    Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
    Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
    Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
    Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
    Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }

    Mod+Page_Down        hotkey-overlay-title="下一工作区"             { focus-workspace-down; }
    Mod+Page_Up          hotkey-overlay-title="上一工作区"             { focus-workspace-up; }
    Mod+Ctrl+Page_Down   hotkey-overlay-title="将窗口移至下一工作区"   { move-column-to-workspace-down; }
    Mod+Ctrl+Page_Up     hotkey-overlay-title="将窗口移至上一工作区"   { move-column-to-workspace-up; }

    Mod+Shift+Page_Down   hotkey-overlay-title="将工作区下移"   { move-workspace-down; }
    Mod+Shift+Page_Up     hotkey-overlay-title="将工作区上移"   { move-workspace-up; }

    Mod+WheelScrollDown      cooldown-ms=150 { focus-workspace-down; }
    Mod+WheelScrollUp        cooldown-ms=150 { focus-workspace-up; }
    Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
    Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

    Mod+WheelScrollRight      { focus-column-right; }
    Mod+WheelScrollLeft       { focus-column-left; }
    Mod+Ctrl+WheelScrollRight { move-column-right; }
    Mod+Ctrl+WheelScrollLeft  { move-column-left; }

    Mod+Shift+WheelScrollDown      { focus-column-right; }
    Mod+Shift+WheelScrollUp        { focus-column-left; }
    Mod+Ctrl+Shift+WheelScrollDown { move-column-right; }
    Mod+Ctrl+Shift+WheelScrollUp   { move-column-left; }

    Mod+1 { focus-workspace 1; }
    Mod+2 { focus-workspace 2; }
    Mod+3 { focus-workspace 3; }
    Mod+4 { focus-workspace 4; }
    Mod+5 { focus-workspace 5; }
    Mod+6 { focus-workspace 6; }
    Mod+7 { focus-workspace 7; }
    Mod+8 { focus-workspace 8; }
    Mod+9 { focus-workspace 9; }
    Mod+Ctrl+1 { move-column-to-workspace 1; }
    Mod+Ctrl+2 { move-column-to-workspace 2; }
    Mod+Ctrl+3 { move-column-to-workspace 3; }
    Mod+Ctrl+4 { move-column-to-workspace 4; }
    Mod+Ctrl+5 { move-column-to-workspace 5; }
    Mod+Ctrl+6 { move-column-to-workspace 6; }
    Mod+Ctrl+7 { move-column-to-workspace 7; }
    Mod+Ctrl+8 { move-column-to-workspace 8; }
    Mod+Ctrl+9 { move-column-to-workspace 9; }

    Mod+R         hotkey-overlay-title="更改窗口大小"     { switch-preset-column-width; }
    Mod+F         hotkey-overlay-title="窗口最大化"       { maximize-column; }
    Mod+Shift+F   hotkey-overlay-title="窗口全屏"         { fullscreen-window; }
    Mod+Ctrl+C         hotkey-overlay-title="将窗口移至中央"   { center-column; }

    Mod+Minus   hotkey-overlay-title="减小窗口宽度"       { set-column-width "-5%"; }
    Mod+Equal   hotkey-overlay-title="增大窗口宽度"       { set-column-width "+5%"; }

    Mod+Shift+Minus   hotkey-overlay-title="减小窗口高度" { set-window-height "-5%"; }
    Mod+Shift+Equal   hotkey-overlay-title="增大窗口高度" { set-window-height "+5%"; }

    Print      hotkey-overlay-title=null   { screenshot; }
    Ctrl+Print hotkey-overlay-title=null   { screenshot-screen; }
    Alt+Print  hotkey-overlay-title=null   { screenshot-window; }
  }
  '';
}
