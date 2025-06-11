{ config, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
        serif  = [ "Iosevka Nerd Font" "Sarasa Gothic SC" ];
        sansSerif = [ "Iosevka Nerd Font" "Sarasa Gothic SC" ];
        monospace = [ "IosevkaTerm Nerd Font Mono" "Sarasa Mono SC" ];
        emoji = [ "Twitter Color Emoji" ];
    };
  };
}