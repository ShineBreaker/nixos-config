{
  config,
  pkgs,
  lib,
  ...
}:
{

  # environment.systemPackages = [
  #   pkgs.sparkle
  # ];

  # security.wrappers.sparkle = {
  #   owner = "root";
  #   group = "root";
  #   capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
  #   source = lib.getExe pkgs.sparkle;
  # };

  programs.clash-verge = {
    enable = true;
    autoStart = false;
    tunMode = true;
    serviceMode = true;
  };

}
