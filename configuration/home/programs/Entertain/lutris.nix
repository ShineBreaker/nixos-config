{
  pkgs,
  ...
}:

{
  programs.lutris = {
    enable = true;
    defaultWinePackage = pkgs.proton-cachyos_x86_64_v4;
    extraPackages = with pkgs; [
      mangohud
      winetricks
      gamescope_git
      gamemode
    ];
  };
}
