{
  pkgs,
  ...
}:

{
  imports = [
    ./chromium.nix
    ./firefox.nix

    ./wps-office/default.nix
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

      noto-fonts = sarasa-gothic;
      noto-fonts-lgc-plus = sarasa-gothic;
      noto-fonts-cjk-sans = sarasa-gothic;
    })

    obsidian
    gimp3-with-plugins

    (qq.override {
      commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    })
    # wechat
    telegram-desktop
  ];
}
