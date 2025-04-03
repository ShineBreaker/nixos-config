{ config, pkgs, lib, ... }:

{
  imports = [
    ./programs/install-user.nix
    # ./desktop/services/dconf-gnome.nix
  ];

  programs.home-manager.enable = true;
  home.username = "brokenshine";
  home.homeDirectory = "/home/brokenshine";
  home.stateVersion = "21.11";

  fonts.fontconfig.enable = true;

  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = ["qemu:///system"];
        uris = ["qemu:///system"];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  xdg = {
    enable = true;
    userDirs.enable = true;
    configFile = {
      ".nix-channels".source = ./dotfiles/.nix-channels;
      "waybar/config".source = ./dotfiles/waybar-config;
      "waybar/style.css".source = ./dotfiles/waybar-style.css;
      "niri/config.kdl".source = ./dotfiles/niri-config.kdl;
      "alacritty.toml".source = ./dotfiles/alacritty.toml;
      "mako/config".source = ./dotfiles/mako-config;
    };
  };

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-text-pthread
    ];
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
