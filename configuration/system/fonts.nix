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
      nerd-fonts.meslo-lg
      noto-fonts
      noto-fonts-emoji-blob-bin
      wqy_microhei
    ];
    fontconfig = {
      useEmbeddedBitmaps = false;
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
  };
}
