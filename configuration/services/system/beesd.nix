{ 
  pkgs,
  ...
}:


{
  environment.systemPackages = [
    pkgs.bees
  ];
  
  services.beesd.filesystems."default" = {
    spec = "/dev/disk/by-uuid/2f6b6499-2a27-4583-847f-dd70b9fcb036";
    hashTableSizeMB = 1024;
    verbosity = "crit";
    extraOptions = [ "--loadavg-target" "5.0" "--thread-count" "4" ];
  };
}
