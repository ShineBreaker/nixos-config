# configuration.nix
{
  config,
  lib,
  pkgs,
  ...
}:
{
  fileSystems."/" = lib.mkForce {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=25%"
      "mode=755"
    ];
  };

  fileSystems."/persist" = {
    device = config.fileSystems."/data".device;
    fsType = config.fileSystems."/data".fsType;
    options = [
      "subvol=SYSTEM/NixOS/@persist"
      "compress=zstd:6"
    ];
  };

  preservation = {
    enable = true;
    preserveAt."/persist" = {
      directories = [
        "/etc/secureboot"
        "/var/log"
      ];

      files = [
        {
          file = "/etc/machine-id";
          inInitrd = true;
        }
        {
          file = "/etc/ssh/ssh_host_rsa_key";
          how = "symlink";
          configureParent = true;
        }
        {
          file = "/etc/ssh/ssh_host_ed25519_key";
          how = "symlink";
          configureParent = true;
        }
      ];
    };
  };
}
