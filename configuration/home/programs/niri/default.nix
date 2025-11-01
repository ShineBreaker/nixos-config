{
  pkgs,
  ...
}:

{
  imports = [
    ./config.nix
    ./rules.nix
    ./binds.nix
  ];

  home.packages = with pkgs; [
    # vicinae
  ];
}
