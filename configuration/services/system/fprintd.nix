{
  pkgs,
  lib,
  config,
  ...
}:

{
  systemd.services.fprintd = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "simple";
  };

  services.fprintd.enable = true;

  security.pam.services.gtklock = lib.mkIf (config.programs.gtklock.enable) {
    text = ''
      auth sufficient ${pkgs.linux-pam}/lib/security/pam_unix.so try_first_pass likeauth nullok
      auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth include    login
    '';
  };

  security.pam.services.sddm = lib.mkIf (config.services.displayManager.sddm.enable) {
    text = ''
      auth sufficient ${pkgs.linux-pam}/lib/security/pam_unix.so try_first_pass likeauth nullok
      auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth      substack      login
      account   include       login
      password  substack      login
      session   include       login
    '';
  };
}