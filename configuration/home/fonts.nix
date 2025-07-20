{ config, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
        serif = [
          "WenQuanYi Micro Hei"
          "Noto Serif"
        ];
        sansSerif = [
          "WenQuanYi Micro Hei"
          "Noto Sans"
        ];
        monospace = [ "Maple Mono NF CN" ];
        emoji = [ "Blobmoji" ];
      };
  };
}