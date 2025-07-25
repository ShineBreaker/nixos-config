{ config, pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      jq
      ffmpeg
      libsndfile
      gcc
      nss
    ];
  };
}
