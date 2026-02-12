{
  pkgs,
  ...
}:

{
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraArgs = "-system-composer";
    };
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;

    extraPackages = with pkgs; [
      javaPackages.compiler.temurin-bin.jre-8
    ];
  };

  programs.gamescope = {
    enable = true;
    args = [
      "--borderless"
      "--force-grab-cursor"
      "-W 3072"
      "-H 1920"
    ];
  };

  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        desiredgov = "performance";
      };
      custom = {
        start = "${pkgs.libnotify}/bin/notify-send '游戏模式已开启' && ${pkgs.mako}/bin/makoctl mode -a do-not-disturb";
        end = "${pkgs.mako}/bin/makoctl mode -r do-not-disturb && ${pkgs.libnotify}/bin/notify-send '游戏模式已关闭'";
      };
    };
  };

  users.users.brokenshine.extraGroups = [ "gamemode" ];

  hardware.steam-hardware.enable = true;

}
