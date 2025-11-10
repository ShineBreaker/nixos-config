{
  pkgs,
  ...
}:

{
  imports = [
    ./winapps/default.nix

    ./kdeconnect.nix
    ./keepass.nix
    ./obs-studio.nix
    ./virt-manager.nix
  ];

  home.packages = with pkgs; [
    filezilla
  ];
}
