{ config, ... }:
{
  xdg = {
    enable = true;
    userDirs.enable = true;

    desktopEntries = {
        QQ = {
          name = "QQ";
          exec = "${pkgs.qq}/bin/qq --enable-wayland-ime --wayland-text-input-version=3 %U";
          startupWMClass= = "QQ";
          icon = "${pkgs.qq}/share/icons/hicolor/512x512/apps/qq.png";
          categories = [ "Network" ];
          comment= "轻松做自己";
        };
    };
  };
};