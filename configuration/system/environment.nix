{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    gcc
    yad

    fastfetch
    git
    uv
    nix-output-monitor
    btop
    wget

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
