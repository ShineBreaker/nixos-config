{
  lib,
  ...
}:

{
  imports = [
    ../home/file.nix
    ../home/fonts.nix
    ../home/programs.nix
    ../home/theme.nix
    ../home/xdg.nix
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
    niri.enable = false;
    waybar.enable = false;
    firefox.profileNames = [ "default" ];
  };
}
