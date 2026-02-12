{
  pkgs,
  ...
}:

{
  imports = [
    ./fastfetch/default.nix
    ./starship/default.nix

    ./fish.nix
    # ./foot.nix
    ./kitty.nix
  ];

  home.packages = with pkgs; [
    upscayl-ncnn
    ffmpeg
    imagemagick

    just
    yazi
  ];
}
