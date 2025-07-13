{ config, lib, ... }:
{
  programs = {
    adb.enable = true;
    git.enable = true;

    appimage = {
      enable = true;
      binfmt = true;
    };

    zoxide.enable = true;
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  services.envfs.enable = true;
  
  documentation.nixos.enable = false;
}
