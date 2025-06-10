{ config, pkgs, lib, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
      serif  = [ "Sarasa Gothic SC" ];
      sansSerif = [ "Sarasa Gothic SC" ];
      monospace = [ "IosevkaTerm Nerd Font Mono" "Sarasa Mono SC" ];
      emoji = [ "Twitter Color Emoji" "Font Awesome 6 Free" ];
    };
  };
}