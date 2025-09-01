{ 
  pkgs,
  ...
}:


{
  environment.systemPackages = [
    pkgs.bees
  ];
  
  services.beesd.filesystems."default" = {
    spec = "/";
    hashTableSizeMB = 2048;
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" "--thread-count" "4" ];
  };
}