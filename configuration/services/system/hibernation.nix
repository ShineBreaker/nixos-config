{
  ...
}:

{
  boot.kernelParams = [
    "resume_offset=55846144"
  ];

  boot.resumeDevice = "/dev/disk/by-uuid/d8b51e69-ff95-4e60-8373-9581da1d6c7d";

  systemd.sleep.extraConfig = ''
    HibernateDelaySec=15m
  '';
}
