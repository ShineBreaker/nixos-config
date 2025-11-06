{
  ...
}:

{
  imports = [
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

  xdg.configFile = {
    "waybar/config.jsonc".source = ./dotfiles/waybar-config.jsonc;
  };
}
