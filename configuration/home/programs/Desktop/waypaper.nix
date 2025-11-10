{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    swww
    mpvpaper
    waypaper

    socat
  ];

  programs.niri.settings = {
    spawn-at-startup = [
      {
        argv = [
          "waypaper"
          "--restore"
        ];
      }
    ];
    window-rules = [
      {
        matches = [
          { app-id = "waypaper"; }
        ];
        open-floating = true;
      }
    ];
  };
}
