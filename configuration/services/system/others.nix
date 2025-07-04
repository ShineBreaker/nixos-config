{ config, lib, ... }:
{
  programs = {
    adb.enable = true;
    git.enable = true;

    gamemode.enable = true;
    wshowkeys.enable = false;

    appimage = {
      enable = true;
      binfmt = true;
    };

    zoxide.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  documentation.nixos.enable = false;
}
