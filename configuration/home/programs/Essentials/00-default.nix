{
  pkgs,
  ...
}:

{
  imports = [
    # ./chromium.nix
    ./firefox.nix

    # ./wps-office/default.nix
  ];
  home.packages = with pkgs; [
    libreoffice

    # (qq.override {
    #   commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    # })
    # wechat
    telegram-desktop
  ];
}
