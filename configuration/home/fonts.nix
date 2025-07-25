{ config, ... }:
{
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Noto Serif CJK SC"
        "NotoSerif Nerd Font"
      ];
      sansSerif = [
        "Noto Sans CJK SC"
        "NotoSans Nerd Font"
      ];
      monospace = [ "Maple Mono NF CN" ];
      emoji = [ "Noto Color Emoji" "Blobmoji" ];
    };
  };
}