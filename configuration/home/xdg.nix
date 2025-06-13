{ config, pkgs, ... }:
{
  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
        "inode/directory" = [ "nemo.desktop" ];
        "application/x-gnome-saved-search" = [ "nemo.desktop" ];
      };
    };

    desktopEntries = {

      qq = {
        name = "QQ";
        exec = "${pkgs.qq}/bin/qq --enable-wayland-ime --wayland-text-input-version=3 %U";
        icon = "${pkgs.qq}/share/icons/hicolor/512x512/apps/qq.png";
        categories = [ "Network" ];
        comment = "轻松做自己";
      };

    };
  };
}
