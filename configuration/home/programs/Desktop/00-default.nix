{
  pkgs,
  ...
}:

{
  imports = [
    # ./programs/dankMaterialShell/default.nix
    ./programs/fish/default.nix
    # ./programs/linux-wallpaperengine/default.nix
    ./programs/niri/default.nix
    # ./programs/noctalia/default.nix
    ./programs/rime/default.nix
    ./programs/waybar/default.nix

    ./programs/fuzzel.nix
    ./programs/mako.nix
    ./programs/swayidle.nix
    # ./programs/vicinae.nix
    ./programs/waypaper.nix
  ];

  home.packages = with pkgs; [
    coppwr
    lxqt.pcmanfm-qt
    mpv
    nomacs
    peazip
  ];
}
