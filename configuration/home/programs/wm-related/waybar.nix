{
  lib,
  ...
}:

{
  xdg.configFile = {
    "waybar/config.jsonc".source = ./dotfiles/waybar-config.jsonc;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    style = lib.mkAfter ''
* {
    font-family: "Iosevka Nerd Font Propo";
    font-weight: 500;
    font-size: 17px;
 
    border-radius: 0px;
    text-shadow: none;
 
    transition-property: background;
    transition-duration: 0.2s;
}
 
window#waybar {
    background-color: alpha(@base00, 0.95);
    padding-left: 0px;
    padding-right: 6px;

    font-family: inherit;
}

.modules-left {
    background-color: transparent;
    padding-top: 4px;
}
 
 
.modules-right {
    background-color: transparent;
    padding-bottom: 4px;
}

window#waybar.hidden  {
    opacity: 0.2;
}

tooltip {
    color: @base07;
    background-color: @base02;
    border-radius: 12px;
}

tooltip label {
    color: @base07;
    background-color: @base02;
    border-radius: 12px;
    font-size: 14px;
}

#custom-lock,
#custom-poweroff,
#custom-reboot,
#custom-search,
#custom-hibernate,
#custom-caffeine,
#workspaces button,
#tray,
#backlight,
#battery,
#cpu,
#memory,
#network,
#wireplumber,
#clock 
{
    color: @base07;
    border-radius: 12px;
    padding: 3px;
    margin: 2px 5px;
}

#battery { color: @base0D; }

#clock { 
    font-size: 16px;
    color: @base07; 
}

#cpu { color: @base08; }

#backlight { color: @base0A;}

#memory { color: @base0E; }

#wireplumber { color: @base0B; }

#network { color: @base0C; }

#custom-lock { color: @base0A; }

#custom-poweroff { color: @base08; }

#custom-reboot { color: @base0C; }

#custom-search { color: @base07; }

#custom-hibernate { color: @base0B; }

#custom-caffeine { color: @base09; }

#workspaces button.focused { 
    background-color: alpha(@base07, 0.2);
    color: @base0C; 
}
    '';
  };
}
