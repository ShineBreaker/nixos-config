{ pkgs, ... }:
{
  home.packages = with pkgs; [
    wineWowPackages.stagingFull
    winetricks
    heroic
    lutris

    brave

    kdePackages.kdenlive

    mpv
    nomacs

    coppwr
    xclicker
    bleachbit

    gh

    qq
    telegram-desktop
    
    libreoffice-fresh
    vscode-fhs

    hmcl

    # nordic
    orchis-theme
    # vimix-gtk-themes

    papirus-icon-theme
    adwaita-icon-theme

    # tela-circle-icon-theme
    # tela-icon-theme

    graphite-cursors
  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
    ];
  };

}
