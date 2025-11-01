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
    ./programs/linux-wallpaperengine/default.nix
    ./programs/niri/default.nix
    # ./programs/noctalia/default.nix
    ./programs/rime/default.nix
    ./programs/winapps/default.nix
    ./programs/wm-related/default.nix
    # ./programs/wps-office/default.nix

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
    # ./programs/waypaper.nix
    ./programs/zed.nix
  ];

  xdg = {
    enable = true;
    autostart.enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;
  };

  home.packages = with pkgs; [
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.proton-cachyos_x86_64_v4
      ];
    })

    # (hmcl.override {
    #   hmclJdk = graalvmPackages.graalvm-ce;
    #   minecraftJdks = [
    #     graalvmPackages.graalvm-ce
    #     zulu8
    #     zulu17
    #   ];
    # })

    (prismlauncher.override {
      jdks = [
        graalvmPackages.graalvm-ce
        zulu8
        zulu17
        zulu
      ];
    })

    (mcaselector.override {
      jre = zulu.override {
        enableJavaFX = true;
      };
    })

    lutris

    mangohud_git
    hexo-cli
    upscayl-ncnn
    gh

    libreoffice

    ffmpeg
    imagemagick

    nomacs
    mpv

    # (qq.override {
    #   commandLineArgs = "--enable-wayland-ime --wayland-text-input-version=3";
    # })
    # wechat
    telegram-desktop

    coppwr
    filezilla
    freerdp

    lxqt.pcmanfm-qt
    lxqt.lxqt-archiver
  ];

}
