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

    ./direnv/default.nix
  ];
  home.packages = with pkgs; [
    gh
    postman
  ];
}
