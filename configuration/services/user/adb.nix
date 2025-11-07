{
  pkgs,
  ...
}:

{
  programs = {
    adb.enable = true;
  };

  environment.systemPackages = [
    pkgs.qtscrcpy
  ];
}
