{
  config,
  pkgs,
  lib,
  ...
}:

{
  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = config.fonts.fontconfig.defaultFonts.sansSerif;

        sansSerif = [
          "Sarasa Gothic SC"
        ];

        monospace = [
          "Maple Mono NF CN"
        ];

        emoji = [
          "Noto Color Emoji"
        ];
      };
    };

    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      nerd-fonts.iosevka
      noto-fonts-color-emoji
      sarasa-gothic
    ];
  };
}
