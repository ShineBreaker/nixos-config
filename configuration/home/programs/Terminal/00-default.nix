{
  pkgs,
  ...
}:

{
  imports = [
    ./programs/fastfetch/default.nix
    ./programs/fish/default.nix

    ./programs/foot.nix
    # ./programs/kitty.nix
  ];
  home.packages = with pkgs; [
    upscayl-ncnn
    ffmpeg
    imagemagick
  ];
}
