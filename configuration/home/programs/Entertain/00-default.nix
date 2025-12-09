{
  pkgs,
  ...
}:

{
  imports = [
    ./lutris.nix
  ];

  home.packages = with pkgs; [
    heroic

    (prismlauncher.override {
      jdks = [
        pkgs.javaPackages.compiler.temurin-bin.jre-8
        pkgs.javaPackages.compiler.temurin-bin.jre-17
        pkgs.javaPackages.compiler.temurin-bin.jre-21
        pkgs.javaPackages.compiler.temurin-bin.jre-25
      ];
    })

    mangohud
    protonup-rs
  ];
}
