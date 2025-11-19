{
  ...
}:

{
  imports = [
    ./direnv.nix
    ./shellScrpit.nix
  ];

  xdg.configFile = {
    "fish/conf.d/direnv.fish".source = ./dotfiles/direnv.fish;
  };
}
