{
  pkgs,
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
}
