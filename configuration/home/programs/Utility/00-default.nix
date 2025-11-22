{
  pkgs,
  ...
}:

{
  imports = [
    ./winapps/default.nix

    ./apx.nix
    ./kdeconnect.nix
    ./keepass.nix
    ./obs-studio.nix
    ./virt-manager.nix
  ];

  home.packages = with pkgs; [
    filezilla
  ];
}
