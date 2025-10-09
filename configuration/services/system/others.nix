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

    dankMaterialShell.greeter = {
      enable = true;
      compositor.name = "niri";
    };
  };

  documentation.nixos.enable = false;
}
