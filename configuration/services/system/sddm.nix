{ 
    pkgs,
  ... 
}:

{
  environment.systemPackages = [
    pkgs.sddm-astronaut
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";
  };

  security.pam.services.sddm-fingerprint.text = "
    auth 			[success=1 new_authtok_reqd=1 default=ignore]  	pam_unix.so try_first_pass likeauth nullok
    auth 			sufficient  	pam_fprintd.so
  ";
}