{
  ...
}:

{
  xdg.configFile = {
    "niri/config.kdl".source = ./dotfiles/config.kdl;
  };

  services.polkit-gnome.enable = true;
}
