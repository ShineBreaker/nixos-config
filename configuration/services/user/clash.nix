{
  pkgs,
  lib,
  ...
}:

{

  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    tunMode = true;
    serviceMode = true;
  };

  networking.proxy.default = "http://127.0.0.1:7897";

  /*
    environment.systemPackages = [
      pkgs.sparkle
    ];

    security.wrappers.tunnel = {
      owner = "root";
      group = "root";
      capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
      source = lib.getExe pkgs.sparkle;
    };

    networking.proxy.default = "http://127.0.0.1:7890";
  */

  networking.firewall.trustedInterfaces = [ "mihomo" ];
}
