{ config, pkgs, lib, ... }:
{
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      wqy_microhei
      nerd-fonts.noto
      maple-mono.NF-CN
      noto-fonts-emoji-blob-bin
    ];
    fontconfig = {
      useEmbeddedBitmaps = false;
      defaultFonts = {
        serif  = [ "WenQuanYi Micro Hei" "NotoSerif Nerd Font" ];
        sansSerif = [ "WenQuanYi Micro Hei" "NotoSans Nerd Font" ];
        monospace = [ "Maple Mono NF CN" "WenQuanYi Micro Hei Mono" ];
        emoji = [ "Blobmoji" ];
      };
    };
  };
}
