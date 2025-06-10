{ config, pkgs, lib, ... }:
{
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      font-awesome
      nerd-fonts.iosevka
      nerd-fonts.iosevka-term
      sarasa-gothic
      twemoji-color-font
    ];
    fontconfig.defaultFonts = {
      serif  = [ "Sarasa Gothic SC regular" ];
      sansSerif = [ "Sarasa Gothic SC regular" ];
      monospace = [ "Sarasa Mono SC" ];
      emoji = [ "Twitter Color Emoji Regular" ];
    };
  };
}
