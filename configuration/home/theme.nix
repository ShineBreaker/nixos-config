{
  pkgs,
  ...
}:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home.packages = with pkgs; [
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qt6ct
    adwaita-icon-theme

    maple-mono.NF-CN
    nerd-fonts.iosevka
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    sarasa-gothic
  ];

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
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
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 26;

    dotIcons.enable = true;
    gtk.enable = true;
    x11 = {
      enable = true;
      defaultCursor = "default";
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        accent-color = "teal";
      };
    };
  };
}
