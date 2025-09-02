{ 
  pkgs,
  ...
}:


{
  environment.systemPackages = [
    pkgs.bees
  ];
  
  services.beesd.filesystems."default" = {
    spec = "/dev/disk/by-uuid/d8b51e69-ff95-4e60-8373-9581da1d6c7d";
    hashTableSizeMB = 1024;
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" "--thread-count" "4" ];
  };
}