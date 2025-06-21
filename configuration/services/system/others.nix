{ config, lib, ... }:
{
  programs = {
    dconf.enable = true;
    adb.enable = true;
    git.enable = true;

    coolercontrol.enable = true;
    gamemode.enable = true;
    wshowkeys.enable = false;

    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  documentation.nixos.enable = false;
}
