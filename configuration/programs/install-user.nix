{ pkgs, ... }:
{
  imports = [
    ../desktop/theme/default.nix
  ];
  
  home.packages = with pkgs; [
    wineWowPackages.stagingFull
    winetricks
    heroic
    bottles
    lutris

    brave

    kdePackages.kdenlive

    mpv
    nomacs
    wf-recorder

    coppwr
    ventoy-full
    xclicker
    bleachbit

    qq
    telegram-desktop
    
    libreoffice-fresh
    vscode-fhs

    hmcl
  ];
}
