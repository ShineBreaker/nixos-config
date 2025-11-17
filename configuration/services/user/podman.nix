{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    distrobox_git
    podman-compose
    podman-tui
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };
}
