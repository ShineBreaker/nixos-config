{
  pkgs,
  ...
}:

{
  imports = [
    ./programs/Desktop/00-default.nix
    ./programs/Develop/00-default.nix
    ./programs/Entertain/00-default.nix
    ./programs/Essentials/00-default.nix
    ./programs/Terminal/00-default.nix
    ./programs/Utility/00-default.nix
  ];

  xdg = {
    enable = true;
    userDirs.enable = true;
    userDirs.createDirectories = true;

    autostart = {
      enable = true;
      readOnly = false;
      entries = [
        "${pkgs.sparkle.out}/share/applications/sparkle.desktop"
      ];
    };
  };

}
