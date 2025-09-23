{ config, pkgs, lib, ... }:
{
  services.pass-secret-service.enable = true;
  programs.keepassxc.enable = true;
}
