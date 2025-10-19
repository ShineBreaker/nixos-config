{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    git
    conda
    nodejs

    nix-output-monitor
    btop
    wget
    sbctl

    unzip
    unrar
    p7zip

    bibata-cursors
    adwaita-icon-theme
  ];

  environment.localBinInPath = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
  };
}
