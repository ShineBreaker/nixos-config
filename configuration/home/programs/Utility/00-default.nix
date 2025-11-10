{
  pkgs,
  ...
}:

{
  imports = [
    ./programs/winapps/default.nix

    ./programs/kdeconnect.nix
    ./programs/keepass.nix
    ./programs/obs-studio.nix
    ./programs/virt-manager.nix
  ];

  home.packages = with pkgs; [
    filezilla
  ];
}
