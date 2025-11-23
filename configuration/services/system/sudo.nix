{ lib, ... }:
{
  security.sudo-rs = {
    enable = true;
    wheelNeedsPassword = lib.mkForce true;
  };

  security.pam.services = {
    "su-l".fprintAuth = false;
    "sudo".fprintAuth = false;
    "sudo-i".fprintAuth = false;
  };
}
