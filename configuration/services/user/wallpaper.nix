{ 
  pkgs, 
  ... 
}:

{
  environment.systemPackages = with pkgs; [
    swww
    mpvpaper
    waypaper
    
    socat
  ];
}
