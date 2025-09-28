{ lib, ... }:
{
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = lib.mkForce true;
  };
}
