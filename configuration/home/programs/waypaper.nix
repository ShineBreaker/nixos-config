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
  };
}
