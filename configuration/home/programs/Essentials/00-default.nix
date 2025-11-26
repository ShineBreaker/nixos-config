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
    (libreoffice.overrideAttrs {
      variant = "fresh";
      withHelp = false;
      kdeIntegration = false;
      withJava = false;

      langs = [
        "en-GB"
        "en-US"
        "zh-CN"
      ];

      noto-fonts = null;
      noto-fonts-lgc-plus = null;
      noto-fonts-cjk-sans = null;
    })
    obsidian

    (qq.override {
      commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    })
    # wechat
    telegram-desktop
  ];
}
