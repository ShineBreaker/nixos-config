{
  ...
}:

{
  programs.foot = {
    enable = true;
    theme = "tokyonight-storm";
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
      colors = {
        alpha = "0.9";
      };
    };
  };
}