{
  pkgs,
  ...
}:

{
  imports = [
    # ./programs/code.nix
    ./programs/helix.nix
    ./programs/jujutsu.nix
    # ./programs/lapce.nix
    ./programs/pixi.nix
    ./programs/zed.nix
  ];
  home.packages = with pkgs; [
    gh
    hexo-cli
    jupyter
    postman
  ];
}
