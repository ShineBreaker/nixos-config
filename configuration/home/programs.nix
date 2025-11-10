{
  pkgs,
  ...
}:

{
  imports = [

    # ./programs/dankMaterialShell/default.nix
    ./programs/fastfetch/default.nix
    ./programs/fish/default.nix
    # ./programs/linux-wallpaperengine/default.nix
    ./programs/niri/default.nix
    # ./programs/noctalia/default.nix
    ./programs/rime/default.nix
    ./programs/winapps/default.nix
    ./programs/waybar/default.nix
    ./programs/wps-office/default.nix

    # ./programs/chromium.nix
    # ./programs/code.nix
    ./programs/firefox.nix
    ./programs/foot.nix
    ./programs/fuzzel.nix
    ./programs/helix.nix
    ./programs/kdeconnect.nix
    ./programs/keepass.nix
    # ./programs/kitty.nix
    # ./programs/lapce.nix
    ./programs/lutris.nix
    ./programs/mako.nix
    ./programs/obs-studio.nix
    ./programs/pixi.nix
    ./programs/swayidle.nix
    ./programs/virt-manager.nix
    # ./programs/vicinae.nix
    ./programs/waypaper.nix
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

    (prismlauncher.override {
      jdks = [
        pkgs.graalvmPackages.graalvm-ce
        pkgs.javaPackages.compiler.temurin-bin.jre-8
        pkgs.javaPackages.compiler.temurin-bin.jre-17
        pkgs.javaPackages.compiler.temurin-bin.jre-21
        pkgs.javaPackages.compiler.temurin-bin.jre-25
      ];
    })

    mangohud_git
    upscayl-ncnn

    gh
    hexo-cli
    jupyter

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
    peazip
  ];

}
