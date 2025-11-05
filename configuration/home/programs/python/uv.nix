{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    uv
  ];

  xdg.configFile = {
    "uv/uv.toml".source = ./dotfiles/uv/uv.toml;
  };
}
