{
  lib,
  ...
}:

{
  imports = [
    ../home/desktopEntries.nix
    ../home/file.nix
    ../home/programs.nix
    ../home/theme.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "brokenshine";
    homeDirectory = "/home/brokenshine";
    stateVersion = "21.11";
    shell.enableFishIntegration = true;
    preferXdgDirectories = true;

    activation.installPackages = {
      data = lib.mkForce "";
      before = lib.mkForce [ ];
      after = lib.mkForce [ ];
    };
  };

  stylix.targets = {
    waybar.addCss = false;
  };
}
