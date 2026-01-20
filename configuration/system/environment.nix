{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    fastfetch
    git

    nix-output-monitor
    btop
    wget
    sbctl
    wayvnc

    unzip
    unrar
    p7zip

    ntfsprogs-plus

    adwaita-icon-theme
  ];

  environment.localBinInPath = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    MOZ_ENABLE_WAYLAND = "1";
  };

  documentation = {
    nixos.enable = false;
  };
}
