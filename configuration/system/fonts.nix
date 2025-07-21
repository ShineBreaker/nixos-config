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
      nerd-fonts.noto
      noto-fonts-emoji-blob-bin
    ];
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif = [
          "WenQuanYi Micro Hei"
          "NotoSerif Nerd Font"
        ];
        sansSerif = [
          "WenQuanYi Micro Hei"
          "NotoSans Nerd Font"
        ];
        monospace = [ "Maple Mono NF CN" ];
        emoji = [ "Blobmoji" ];
      };
    };
  };
}
