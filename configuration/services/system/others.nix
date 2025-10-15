{
  ...
}:

{
  programs = {
    adb.enable = true;
    git.enable = true;
    kdeconnect.enable = true;
    appimage = {
      enable = true;
      binfmt = false;
    };
  };

  documentation.nixos.enable = false;
}
