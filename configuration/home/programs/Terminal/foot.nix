{
  ...
}:

{
  dconf = {
    settings = {
      "org/gnome/desktop/applications/terminal" = {
        exec = "foot";
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "foot";
      };
    };
  };

  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "Maple Mono NF CN:size=11";
      };
      cursor = {
        style = "beam";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };

}
