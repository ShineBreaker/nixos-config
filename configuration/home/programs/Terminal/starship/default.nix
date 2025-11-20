{
  ...
}:

{
  imports = [
    ./settings.nix
  ];

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableInteractive = true;
    enableTransience = true;
  };

  stylix.targets.starship.enable = false;
}
