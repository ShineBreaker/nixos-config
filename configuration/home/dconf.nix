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

        monospace-font-name = "Iosevka Nerd Font Mono 11";
        font-name = "更纱黑体 UI SC 11";
        document-font-name = "等距更纱黑体 SC 11";
        accent-color = "teal";
      };

      "org/gnome/desktop/applications/terminal" = {
        exec = "alacritty";
      };
    };
  };
}
