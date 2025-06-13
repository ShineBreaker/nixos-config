
{ config, pkgs, lib, ... }:

{
  imports = [
    ../home/install-user.nix
    ../home/fonts.nix
    ../home/dconf.nix
    ../home/dotfiles.nix
    ../home/theme.nix
    ../home/file.nix
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
      before = lib.mkForce [];
      after = lib.mkForce [];
    };
  };
}
