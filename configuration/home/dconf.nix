{ config, ... }:
{
  dconf = {
    enable = true;
    settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";

        monospace-font-name = "Maple Mono NF CN 11";
        font-name = "WenQuanYi Micro Hei 11";
        document-font-name = "Maple Mono NF CN 11";
        accent-color = "teal";
      };

      "org/gnome/desktop/applications/terminal" = {
        exec = "alacritty";
      };
      "org/cinnamon/desktop/applications/terminal" = {
        exec = "alacritty";
      };
    };
  };
}
