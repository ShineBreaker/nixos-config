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
      sarasa-gothic
    ];
  };
}
