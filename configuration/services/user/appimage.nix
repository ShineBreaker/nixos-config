{
  pkgs,
  ...
}:

{
  programs = {
    appimage = {
      enable = true;
      binfmt = false;
    };
  };
  environment.systemPackages = [
    pkgs.gearlever
  ];
}
