{ 
    pkgs,
  ... 
}:

{
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      themeConfig = {
        General = ''
          HeaderText = "扫描指纹或输入密码解锁"
        '';
      };
    })
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "sddm-astronaut-theme";

    package = pkgs.kdePackages.sddm;
    extraPackages = [ pkgs.kdePackages.qtmultimedia ];

    settings = {
      General = {
        GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=192";
      };
      Wayland = {
        EnableHiDPI = true;
      };
    };
  };

  security.pam.services = {
    sddm.text = ''
      auth sufficient ${pkgs.linux-pam}/lib/security/pam_unix.so try_first_pass likeauth nullok
      auth sufficient ${pkgs.fprintd}/lib/security/pam_fprintd.so
      auth      substack      login
      account   include       login
      password  substack      login
      session   include       login
    '';
  };
}