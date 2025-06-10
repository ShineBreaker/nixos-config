{ config, pkgs, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.graphite-cursors;
      name = "Graphite dark Cursors";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis-Teal-Dark";
    };
  };
}
