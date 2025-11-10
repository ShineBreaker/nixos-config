{
  pkgs,
  ...
}:

{
  imports = [
    # ./dankMaterialShell/default.nix
    # ./linux-wallpaperengine/default.nix
    ./niri/default.nix
    # ./noctalia/default.nix
    ./rime/default.nix
    ./waybar/default.nix

    ./fuzzel.nix
    ./mako.nix
    ./swayidle.nix
    # ./vicinae.nix
    ./waypaper.nix
  ];

  home.packages = with pkgs; [
    coppwr
    lxqt.pcmanfm-qt
    mpv
    nomacs
    peazip
  ];
}
