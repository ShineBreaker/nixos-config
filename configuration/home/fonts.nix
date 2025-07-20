{ config, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
        serif  = [ "WenQuanYi Micro Hei" "NotoSerif Nerd Font" ];
        sansSerif = [ "WenQuanYi Micro Hei" "NotoSans Nerd Font" ];
        monospace = [ "Maple Mono NF CN" "WenQuanYi Micro Hei Mono" ];
        emoji = [ "Blobmoji" ];
      };
  };
}