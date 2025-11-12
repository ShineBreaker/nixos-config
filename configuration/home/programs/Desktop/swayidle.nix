{
  pkgs,
  ...
}:

{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "${pkgs.niri_git.out}/bin/niri msg action power-off-monitors && ${pkgs.gtklock.out}/bin/gtklock -d";
      }
      {
        event = "unlock";
        command = "${pkgs.niri_git.out}/bin/niri msg action power-on-monitors";
      }
      {
        event = "after-resume";
        command = "${pkgs.gtklock.out}/bin/gtklock -d";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.niri_git.out}/bin/niri msg action power-off-monitors && ${pkgs.gtklock.out}/bin/gtklock -d";
      }
    ];
  };
}
