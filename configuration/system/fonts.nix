{
  pkgs,
  lib,
  ...
}:

{
  imports = [ ../home/fonts.nix ];

  fonts = lib.mkForce {
    enableDefaultPackages = false;
    fontconfig.enable = true;
    fontDir.enable = true;
    packages = with pkgs; [
      maple-mono.NF-CN
      nerd-fonts.iosevka
      noto-fonts-color-emoji
      noto-fonts-emoji-blob-bin
      sarasa-gothic
    ];
  };
}
