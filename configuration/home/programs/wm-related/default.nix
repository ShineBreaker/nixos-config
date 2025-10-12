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
    
    layer-rules = [
      {
        matches = [
          { namespace = "waybar"; }
        ];

        shadow = {
          enable = true;
          softness = 4;
          spread = 0;

          offset = {
            x = 0;
            y = 0;
          };
          draw-behind-window = false;
          color = "#000000";
        };
      }
    ];
  };
}
