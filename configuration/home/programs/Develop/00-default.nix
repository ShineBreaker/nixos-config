{
  pkgs,
  ...
}:

{
  imports = [
    # ./code.nix
    ./helix.nix
    ./jujutsu.nix
    # ./lapce.nix
    ./pixi.nix
    ./zed.nix
  ];
  home.packages = with pkgs; [
    gh
    hexo-cli
    jupyter
    postman
  ];
}
