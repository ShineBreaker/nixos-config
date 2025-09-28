{ 
    pkgs,
  ... 
}:

{
  environment.systemPackages = [
    (pkgs.sddm-astronaut.override {
      embeddedTheme = "hyprland_kath";
      themeConfig = {
        General = ''
          HeaderText="请使用指纹或密码解锁"
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


}