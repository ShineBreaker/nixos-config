{
  pkgs,
  lib,
  ...
}:

{
  dconf = {
    settings = {
      "org/gnome/desktop/applications/terminal" = {
        exec = lib.mkForce "kitty";
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = lib.mkForce "kitty";
      };
    };
  };

  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };
    font = {
      package = pkgs.maple-mono.NF-CN;
      name = "Maple Mono NF CN";
      size = 11;
    };
    themeFile = "ayu_mirage";
    settings = {
      cursor_shape = "beam";
      background_opacity = 0.9;
      background_blur = 10;
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
    };
  };

}
