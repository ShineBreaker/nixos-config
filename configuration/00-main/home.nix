{ config, pkgs, lib, ... }:

{
  imports = [
    ../home/install-user.nix
    ../home/fonts.nix
    ../home/dconf.nix
    ../home/dotfiles.nix
  ];

  programs.home-manager.enable = true;
  home.username = "brokenshine";
  home.homeDirectory = "/home/brokenshine";
  home.stateVersion = "21.11";

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    userDirs.enable = true;
  };
  
  home.activation.installPackages = {
    data = lib.mkForce "";
    before = lib.mkForce [];
    after = lib.mkForce [];
  };

  home.file = {
    nix-profile = {
      source = config.home.path;
      target = ".nix-profile";
    };
  };
}
