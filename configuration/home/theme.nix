{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Teal-Dark";
    };
    font = {
      package = pkgs.noto-fonts-cjk-sans;
      name = "Noto Sans CJK SC";
    };
    gtk2.extraConfig = ''
      gtk-cursor-theme-size = 0
      gtk-toolbar-style = GTK_TOOLBAR_BOTH_HORIZ
      gtk-toolbar-icon-size = GTK_ICON_SIZE_LARGE_TOOLBAR
      gtk-button-images = 1
      gtk-menu-images = 1
      gtk-enable-event-sounds = 1
      gtk-enable-input-feedback-sounds = 1
      gtk-xft-antialias = 1
      gtk-xft-hinting = 1
      gtk-xft-hintstyle = "hintfull"
    '';
    gtk3.extraConfig = {
      gtk-cursor-theme-size = 0;
      gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
      gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
      gtk-button-images = 1;
      gtk-menu-images = 1;
      gtk-enable-event-sounds = 1;
      gtk-enable-input-feedback-sounds = 1;
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintfull";
    };
  };
  
  home.pointerCursor = {
    enable = true;
    package = pkgs.graphite-cursors;
    name = "Graphite dark Cursors";
    
    dotIcons.enable = false;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "default";
    };
  };
}
