{
  pkgs,
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
      mangohud_git
      zulu8
    ];
    extraCompatPackages = with pkgs; [
      proton-cachyos_x86_64_v3
    ];
  };

  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope_git;
    args = [
      "--borderless"
      "--backend auto"
      "--force-grab-cursor"
      "-W 3072"
      "-H 1920"
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
