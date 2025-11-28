{
  pkgs,
  ...
}:

{
  xdg = {
    desktopEntries = {
      labwc = {
        name = "labwc";
        exec = "${pkgs.labwc}/bin/labwc";
      };
    };
  };
}
