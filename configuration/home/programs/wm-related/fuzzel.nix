{
  lib,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "monospace:size=10";
        icons-enabled = "no";
        layer = "overlay";
        line-height = "16";
        terminal = "foot";
      };
      border = {
        width = "4";
        radius = "12";
      };
      colors = {
        background = lib.mkForce "#282c34e5";
        selection = lib.mkForce "#545862cc";
      };
    };
  };
}
