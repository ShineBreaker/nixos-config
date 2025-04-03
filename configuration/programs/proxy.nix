{ config, pkgs, lib, ... }:
{
  services.v2raya.enable = true;
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
