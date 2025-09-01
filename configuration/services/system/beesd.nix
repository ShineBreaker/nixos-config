{ 
  pkgs,
  ...
}:


{
  environment.systemPackages = [
    pkgs.bees
  ];
  
  services.beesd.filesystems."default" = {
    spec = "UUID=eb063fae-136d-476c-9b90-83d1056b513d";
    hashTableSizeMB = 2048;
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" "--thread-count" "4" ];
  };
}