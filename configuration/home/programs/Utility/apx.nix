{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (apx.override {
      distrobox = distrobox_git;
    })

    (apx-gui.override {
      apx = (
        apx.override {
          distrobox = distrobox_git;
        }
      );
      gnome-console = null;
    })
  ];

  programs.fish.shellInit = "eval '$(apx completion fish)'";
}
