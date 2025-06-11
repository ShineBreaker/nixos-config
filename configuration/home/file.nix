{config, pkgs, lib, ...}:
{
  home.file = {
    nix-profile = {
      source = config.home.path;
      target = ".nix-profile";
    };

    theme1 = {
      source = "${config.home.path}/share/themes";
      target = ".themes";
    };
    theme2 = {
      source = "${config.home.path}/share/themes";
      target = ".local/share/themes";
    };

    icon1 = {
      source = "${config.home.path}/share/icons";
      target = ".icons";
    };
    icon2 = {
      source = "${config.home.path}/share/icons";
      target = ".local/share/icons";
    };
  };
}
