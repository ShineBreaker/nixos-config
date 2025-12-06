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
    settings = {
      cursor_shape = "beam";
      background_blur = 10;
      cursor_trail = 1;
      cursor_trail_start_threshold = 0;
    };
  };

}
