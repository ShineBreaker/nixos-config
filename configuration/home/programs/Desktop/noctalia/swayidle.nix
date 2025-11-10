{
  ...
}:

{
  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "niri msg action power-off-monitors && noctalia-shell ipc call lockScreen toggle";
      }
      {
        event = "unlock";
        command = "niri msg action power-on-monitors";
      }
      {
        event = "after-resume";
        command = "noctalia-shell ipc call lockScreen toggle";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "niri msg action power-off-monitors && noctalia-shell ipc call lockScreen toggle";
      }
    ];
  };
}
