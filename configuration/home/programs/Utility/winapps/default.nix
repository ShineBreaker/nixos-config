{
  pkgs,
  ...
}:

{
  xdg.configFile = {
    "winapps/winapps.conf".source = ./dotfiles/winapps.conf;
    "winapps/compose.yaml".source = ./dotfiles/compose.yaml;
  };

  home.packages = with pkgs; [
    freerdp
  ];

}
