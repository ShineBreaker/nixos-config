{
  ...
}:

{
  xdg.configFile = {
    "waybar/config.jsonc".source = ../home/dotfiles/waybar-config.jsonc;
    "waybar/style.css".source = ../home/dotfiles/waybar-style.css;

    "niri/config.kdl".source = ../home/dotfiles/niri-config.kdl;

    "fastfetch/config.jsonc".source = ../home/dotfiles/fastfetch-config.jsonc;
    "fastfetch/nix-corner.png".source = ../home/dotfiles/nix-corner.png;

    "winapps/winapps.conf".source = ../home/dotfiles/winapps.conf;
    "winapps/compose.yaml".source = ../home/dotfiles/compose.yaml;
  };

  xdg.dataFile = {
    "fcitx5/rime/default.custom.yaml".source = ../home/dotfiles/default.custom.yaml;
  };
}
