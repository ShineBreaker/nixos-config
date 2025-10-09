{
  ...
}:

{
  programs = {
    adb.enable = true;
    git.enable = true;
    appimage = {
      enable = true;
      binfmt = false;
    };
  };

  documentation.nixos.enable = false;
}
