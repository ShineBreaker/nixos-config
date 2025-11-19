{
  pkgs,
  ...
}:

{
  imports = [
    # ./code.nix
    ./direnv.nix
    ./helix.nix
    ./jujutsu.nix
    # ./lapce.nix
    ./pixi.nix
    ./zed.nix
  ];
  home.packages = with pkgs; [
    gh
    postman
  ];
}
