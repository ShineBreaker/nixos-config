{
  pkgs,
  ...
}:

{
  imports = [
    ./programs/conda/default.nix
    # ./programs/dankMaterialShell/default.nix
    ./programs/fastfetch/default.nix
    ./programs/fish/default.nix
    ./programs/niri/default.nix
    ./programs/noctalia/default.nix
    ./programs/rime/default.nix
    ./programs/winapps/default.nix
    # ./programs/wm-related/default.nix

    ./programs/chromium.nix
    # ./programs/code.nix
    ./programs/firefox.nix
    ./programs/foot.nix
    ./programs/helix.nix
    ./programs/kdeconnect.nix
    ./programs/keepass.nix
    # ./programs/kitty.nix
    # ./programs/lapce.nix
    ./programs/obs-studio.nix
    ./programs/virt-manager.nix
    ./programs/waypaper.nix
    ./programs/zed.nix
  ];

  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;
  };

  home.packages = with pkgs; [
    mangojuice
    mangohud_git

    (bottles.override {
      removeWarningPopup = true;
    })

    (heroic.override {
      extraPkgs =
        pkgs: with pkgs; [
          proton-cachyos_x86_64_v3
          proton-ge-custom
        ];
    })

    (hmcl.override {
      hmclJdk = graalvm-ce;
      minecraftJdks = [
        graalvm-ce
        zulu8
        zulu17
      ];
    })

    # (prismlauncher.override {
    #   jdks = [
    #     graalvm-ce
    #     zulu8
    #     zulu17
    #     zulu
    #   ];
    # })

    (mcaselector.override {
      jre = zulu.override {
        enableJavaFX = true;
      };
    })

    libreoffice
    wpsoffice-cn
    inkscape-with-extensions
    kdePackages.kdenlive

    ffmpeg
    imagemagick
    hexo-cli
    upscayl-ncnn

    gimp3-with-plugins
    nomacs
    mpv

    (qq.override {
      commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    })
    wechat
    telegram-desktop

    coppwr
    filezilla
    freerdp
    baobab

    lxqt.pcmanfm-qt
    peazip
  ];

}
