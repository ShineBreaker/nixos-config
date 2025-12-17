{
  ...
}:

{
  systemd.targets.machines.enable = true;
  systemd.nspawn."archlinux" = {
    enable = true;
    execConfig = {
      Boot = true;
    };

    filesConfig = {
      # Bind resolve.conf to get networking
      BindReadOnly = [ "/etc/resolv.conf:/etc/resolv.conf" ];
      # Bind any directories that you want to be shared
      Bind = [ "/home/brokenshine/.local/container-homes/archlinux" ];
    };
    networkConfig = {
      Private = false;
    };
  };
  systemd.services."systemd-nspawn@archlinux" = {
    enable = true;
    requiredBy = [ "machines.target" ];
    overrideStrategy = "asDropin";
  };
}
