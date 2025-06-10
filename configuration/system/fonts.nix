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
    fontconfig = {
      useEmbeddedBitmaps = true;
      defaultFonts = {
        serif  = [ "Sarasa Gothic SC" ];
        sansSerif = [ "Sarasa Gothic SC" ];
        monospace = [ "IosevkaTerm Nerd Font Mono" "Sarasa Mono SC" ];
        emoji = [ "Twitter Color Emoji" "Font Awesome 6 Free" ];
      };
    };
  };
}
