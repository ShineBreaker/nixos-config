{
  lib,
  pkgs,
  ...
}:

{
  networking = {
    wireless = {
      enable = lib.mkForce false;
      iwd = {
        enable = lib.mkForce true;
        settings = {
          IPv6 = {
            Enabled = true;
          };
          Settings = {
            AutoConnect = true;
          };
        };
      };
    };
  };

  services = {
    pipewire = {
      enable = true;
      pulse.enable = true;
      jack.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };

    pulseaudio.enable = false;

    fstrim = {
      enable = true;
      interval = "weekly";
    };

    scx = {
      enable = true;
      package = pkgs.scx.full;
      scheduler = "scx_rusty";
    };

    xserver = {
      excludePackages = [ pkgs.xterm ];
      upscaleDefaultCursor = true;
    };

    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    udisks2 = {
      enable = true;
      settings = {
        "mount_options.conf" = {
          defaults = {
            # 'ntfs' signature, the new 'ntfs3' kernel driver
            "ntfs:ntfs3_defaults" = "uid=$UID,gid=$GID";
            "ntfs:ntfs3_allow" =
              "uid=$UID,gid=$GID,umask,dmask,fmask,iocharset,discard,nodiscard,sparse,nosparse,hidden,nohidden,sys_immutable,showmeta,noshowmeta,prealloc,noprealloc,hide_dot_files,nohide_dot_files,windows_names,nocase,case";
          };
        };
      };
    };

    gvfs = {
      enable = true;
      package = pkgs.gvfs;
    };

    speechd.enable = lib.mkForce false;
    userborn.enable = true;
  };
}
