{
  config,
  pkgs,
  lib,
  ...
}:

{
  boot.kernelParams = [
    "resume_offset=55846144"
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/d8b51e69-ff95-4e60-8373-9581da1d6c7d";

  # Suspend first then hibernate when closing the lid
  services.logind.lidSwitch = "suspend-then-hibernate";
  services.logind.lidSwitchExternalPower = "lock";

  # Hibernate on power button pressed
  services.logind.powerKey = "suspend-then-hibernate";
  services.logind.powerKeyLongPress = "poweroff";

  # Define time delay for hibernation
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=10m
  '';
}
