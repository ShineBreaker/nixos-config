{
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    distrobox_git

    podman-compose
    pods
  ];

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
  };
}
