{
  pkgs,
  lib,
  ...
}:
{
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      wqy_microhei
      noto-fonts
      noto-fonts-emoji-blob-bin
    ];
    fontconfig = {
      useEmbeddedBitmaps = false;
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
  };
}
