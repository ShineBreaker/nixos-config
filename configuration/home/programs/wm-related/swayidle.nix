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
        command = "niri msg action power-off-monitors && ${pkgs.gtklock}/bin/gtklock -d";
      }
      {
        event = "unlock";
        command = "niri msg action power-on-monitors";
      }
      {
        event = "after-resume";
        command = "${pkgs.gtklock}/bin/gtklock -d";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "niri msg action power-off-monitors && ${pkgs.gtklock}/bin/gtklock -d";
      }
    ];
  };
}
