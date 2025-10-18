{
  ...
}:

{
  imports = [
    ./fuzzel.nix
    ./mako.nix
    ./swayidle.nix
    ./waybar.nix
  ];

  programs.niri.settings = {
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
