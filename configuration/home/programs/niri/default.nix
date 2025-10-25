{
  ...
}:

{
  imports = [
    ./config.nix
    ./rules.nix
    ./binds.nix
  ];

  home.sessionVariables = {
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    # QT_SCALE_FACTOR = "2";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    ELECTRON_ENABLE_HARDWARE_ACCELERATION = "1";

    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "niri";

    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    INPUT_METHOD = "fcitx";
  };
}
