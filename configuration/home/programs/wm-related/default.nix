{
  pkgs,
  ...
}:

{
  imports = [
    # ./fuzzel.nix
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
          enable = false;
        };
      }
    ];
  };
}
