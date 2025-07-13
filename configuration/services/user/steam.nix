{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ steam-run ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      gamescope
      mangohud
      ffmpeg
      openjdk8
    ];
  };

  hardware.steam-hardware.enable = true;

}
