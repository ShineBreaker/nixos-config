{
  config,
  pkgs,
  ...
}:

{
  stylix = {
    enable = true;
    enableReleaseChecks = false;
    overlays.enable = true;
    targets.plymouth.enable = false;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/penumbra-dark-contrast-plus.yaml";
    override = {
      base01 = "#27292c";
      base02 = "#323639";
      base03 = "#44464d";
      base04 = "#676c71";
      base05 = "#ffffff";
      base06 = "#ffffff";
      base07 = "#ffffff";
    };

    polarity = "dark";

    fonts = {
      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.sarasa-gothic;
        name = "Sarasa Gothic SC";
      };

      monospace = {
        package = pkgs.maple-mono.NF-CN;
        name = "Maple Mono NF CN";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 10;
        popups = 10;
        terminal = 11;
      };
    };

    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;

      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };

    opacity = {
      desktop = 0.9;
      popups = 0.95;
      terminal = 0.95;
    };
  };
}
