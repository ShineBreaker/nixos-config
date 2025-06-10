{ config, pkgs, lib, ... }:
{
  fonts.fontconfig = {
    enable = true;
      defaultFonts = {
        serif  = [ "Sarasa Gothic SC regular" ];
        sansSerif = [ "Sarasa Gothic SC regular" ];
        monospace = [ "Sarasa Mono SC" ];
        emoji = [ "Twitter Color Emoji Regular" ];
    };
  };
}