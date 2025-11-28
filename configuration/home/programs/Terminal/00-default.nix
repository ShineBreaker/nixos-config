{
  pkgs,
  ...
}:

{
  imports = [
    ./fastfetch/default.nix
    ./fish/default.nix
    ./starship/default.nix

    ./foot.nix
    # ./kitty.nix
  ];
  home.packages = with pkgs; [
    upscayl-ncnn
    ffmpeg
    imagemagick

    yazi
  ];
}
