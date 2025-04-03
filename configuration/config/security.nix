{config, pkgs, ...}:

{
  security = {
    rtkit.enable = true;
    apparmor.enable = true;
  };
}
