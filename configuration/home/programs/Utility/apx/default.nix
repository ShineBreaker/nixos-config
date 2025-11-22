{
  ...
}:

{
  imports = [
    ./apx.nix
  ];

  xdg.configFile = {
    "fish/conf.d/apx.fish".source = ./dotfiles/apx.fish;
  };

}
