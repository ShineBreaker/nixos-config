{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    uv
  ];
  xdg.configFile = {

  };
  xdg.configFile = {
    "uv/uv.toml".source = ./dotfiles/uv/uv.toml;
    "fish/conf.d/uv.fish".source = ./dotfiles/uv/uv.fish;
  };
}
