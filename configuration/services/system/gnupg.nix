{ 
  lib, 
  ... 
}:

{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    enableExtraSocket = true;
    enableBrowserSocket = true;
  };
  
  services.gnome.gnome-keyring.enable = lib.mkForce false;

}
