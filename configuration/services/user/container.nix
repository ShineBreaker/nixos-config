{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    toolbox

    podman-compose
    podman-tui
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };
}
