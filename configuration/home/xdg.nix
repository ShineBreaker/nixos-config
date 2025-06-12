{ config, ... }:
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
      
    desktopEntries = {
    
      QQ = {
        name = "QQ";
        exec = "${pkgs.qq}/bin/qq --enable-wayland-ime --wayland-text-input-version=3 %U";
         startupWMClass= = "QQ";
         icon = "${pkgs.qq}/share/icons/hicolor/512x512/apps/qq.png";
         categories = [ "Network" ];
         comment= "轻松做自己";
       };
      
       nemo = {
         name = "Nemo";
         exec = "${pkgs.nemo-with-extensions}/bin/nemo";
       };
      
    };
  };
};
