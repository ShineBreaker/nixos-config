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
    ./programs/rime/default.nix
    ./programs/winapps/default.nix
    ./programs/wm-related/default.nix

    ./programs/firefox.nix
    ./programs/helix.nix
    ./programs/kdeconnect.nix
    ./programs/keepass.nix
    # ./programs/kitty.nix
    # ./programs/lapce.nix
    ./programs/obs-studio.nix
    ./programs/virt-manager.nix
  ];

  dconf = {
    settings = {
      "org/gnome/desktop/applications/terminal" = {
        exec = "foot";
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "foot";
      };
    };
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
        zulu
      ];
    })

    (prismlauncher.override {
      jdks = [
        graalvm-ce
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

    libreoffice
    inkscape-with-extensions

    ffmpeg
    imagemagick

    nomacs
    mpv
    ungoogled-chromium

    coppwr
    filezilla
    freerdp
    baobab

    telegram-desktop
    thunderbird

    nixd
    jujutsu_git
  ];

}
