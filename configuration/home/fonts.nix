{ config, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
        serif = [
          "MesloLGM Nerd Font"
          "WenQuanYi Micro Hei"
          "Noto Serif"
        ];
        sansSerif = [
          "MesloLGM Nerd Font"
          "WenQuanYi Micro Hei"
          "Noto Sans"
        ];
        monospace = [ "Maple Mono NF CN" ];
        emoji = [ "Blobmoji" ];
      };
  };
}