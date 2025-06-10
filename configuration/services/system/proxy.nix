{ config, pkgs, lib, ... }:
{

  environment.systemPackages = [
    pkgs.sparkle
  ];

  security.wrappers.sparkle = {
    owner = "root";
    group = "root";
    capabilities = "cap_net_bind_service,cap_net_raw,cap_net_admin=+ep";
    source = lib.getExe pkgs.sparkle;
  };
  
  services.mihomo = {
    enable = false;
    tunMode = true;
    webui = pkgs.metacubexd;
    configFile = "/etc/mihomo.yaml";
  };
  
  programs.proxychains = {
    enable = true;
    proxies = {
      default = {
        type = "http";
        host = "127.0.0.1";
        port = 20172;
      };
    };
  };
}
