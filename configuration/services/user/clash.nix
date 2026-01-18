{
  ...
}:

{
  services.mihomo = {
    enable = true;
    configFile = "/home/brokenshine/.config/mihomo/config.yaml";
    tunMode = true;
  };

  networking.proxy.default = "http://127.0.0.1:7890";

  networking.firewall.trustedInterfaces = [ "mihomo" ];
}
