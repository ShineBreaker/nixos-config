{ config, pkgs, lib, ... }:
{
  environment.systemPackages = [
    pkgs.git-credential-keepassxc
  ];
  
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config.credential = {
      # helper = "libsecret";
      "https://github.com".username = "ShineBreaker";
      "https://gitee.com".username = "BrokenShine";
      credentialStore = "cache";
    };
  };
  
}