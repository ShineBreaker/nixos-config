{
  config,
  pkgs,
  lib,
  ...
}:
{
  environment.systemPackages = with pkgs; [ steam-run ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      mangohud
      zulu8
    ];
  };

  programs.gamescope = {
    enable = true;
    args = [
      "--fullscreen"
      "--force-windows-fullscreen"
      "--backend sdl"
      "--force-grab-cursor"
      "-W 3072" "-H 1920"
    ];
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        renice = 10;
        desiredgov = "performance";
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send '游戏模式已开启'";
        end = "${pkgs.libnotify}/bin/notify-send '游戏模式已关闭'";
      };
    };
  };

  users.users.brokenshine.extraGroups = [ "gamemode" ];

  hardware.steam-hardware.enable = true;

}
