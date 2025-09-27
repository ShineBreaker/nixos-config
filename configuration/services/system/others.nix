{ 
  ... 
}:

{
  programs = {
    adb.enable = true;
    git.enable = true;
    appimage = {
      enable = true;
      binfmt = true;
    };
  };

  documentation.nixos.enable = false;


}
