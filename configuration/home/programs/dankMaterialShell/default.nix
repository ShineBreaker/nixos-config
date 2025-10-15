{
  pkgs,
  ...
}:

{

  imports = [
    ./niri-config.nix
  ];

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;

    niri = {
      enableSpawn = false;
      enableKeybinds = true;
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "lock";
        command = "dms ipc call lock lock";
      }
      {
        event = "unlock";
        command = "${pkgs.niri}/bin/niri msg action power-on-monitors";
      }
      {
        event = "after-resume";
        command = "dms ipc call lock lock";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "dms ipc call lock lock && ${pkgs.niri}/bin/niri msg action power-off-monitors";
      }
    ];
  };

}
