{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    vicinae
  ];

  systemd.user.services = {
    vicinae-server = {
      Unit = {
        Description = "Run vicinae-server.";
      };

      Service = {
        ExecStart = "${pkgs.vicinae}/bin/vicinae server";
      };
    };
  };

  programs.niri.settings = {
    binds = {
      "Mod+D" = {
        hotkey-overlay.title = "打开搜索";
        repeat = false;
        action.spawn = [
          "vicinae"
          "open"
        ];
      };
    };
  };
}
