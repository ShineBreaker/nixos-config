{
  ...
}:

{
  imports = [
    ./config.nix
    ./rules.nix
    ./binds.nix
  ];

  services.polkit-gnome.enable = true;
}
