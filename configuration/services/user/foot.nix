{
  ...
}:

{
  programs.foot = {
    enable = true;
    theme = "ayu-mirage";
    settings = {
      main = {
        term = "xterm-256color";
        font = "Maple Mono NF CN:size=8";
        dpi-aware = "yes";
      };
      cursor = {
        style = "beam";
      };
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = "0.9";
      };
    };
  };
}