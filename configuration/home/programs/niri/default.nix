{
  ...
}:

{
  imports = [
    ./config.nix
    ./rules.nix
    ./binds.nix
  ];
  xdg.configFile = {
    # "niri/config.kdl".source = ./dotfiles/config.kdl;
  };
}
