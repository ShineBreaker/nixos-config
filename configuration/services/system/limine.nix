{
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    sbctl
  ];
  
  boot.loader = {
    systemd-boot.enable = lib.mkForce false;
    limine = {
      enable = true;
      secureBoot.enable = true;
      maxGenerations = 10;
    };
  };
}