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
}
