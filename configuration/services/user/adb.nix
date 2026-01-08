{
  pkgs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.qtscrcpy
    pkgs.android-tools
  ];
}
