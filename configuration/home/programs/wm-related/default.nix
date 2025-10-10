{
  pkgs,
  ...
}:

{
  imports = [
    ./fuzzel.nix
    ./mako.nix
    ./swayidle.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    swww
    mpvpaper
    waypaper

    socat
  ];

  programs.niri.settings = {
    spawn-at-startup = [
      { argv = [ "waypaper" "--restore" ]; }
    ];
    window-rules = [
      {
        matches = [{}];

        geometry-corner-radius = {
          top-left = 0.0;
          top-right = 0.0;
          bottom-left = 0.0;
          bottom-right = 0.0;
        };

        clip-to-geometry = true;
        draw-border-with-background = false;
      }
    ];
  };
}
