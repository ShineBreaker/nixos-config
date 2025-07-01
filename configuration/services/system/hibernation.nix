{ config, pkgs, lib, ... }:
{
  boot.kernelParams = ["resume_offset=60"];

  boot.resumeDevice = "/swap/swapfile";

  # Suspend first then hibernate when closing the lid
  services.logind.lidSwitch = "suspend-then-hibernate";

  # Hibernate on power button pressed
  services.logind.powerKey = "hibernate";
  services.logind.powerKeyLongPress = "poweroff";

  # Suspend first
  boot.kernelParams = ["mem_sleep_default=deep"];

  # Define time delay for hibernation
  systemd.sleep.extraConfig = ''
    HibernateDelaySec=60m
    SuspendState=mem
  '';
}
