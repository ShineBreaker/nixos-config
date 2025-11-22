{
  pkgs,
  ...
}:

{
  imports = [
    ./lutris.nix
  ];

  home.packages = with pkgs; [
    (heroic.override {
      extraPkgs = pkgs: [
        pkgs.proton-cachyos_x86_64_v3
      ];
    })

    (prismlauncher.override {
      jdks = [
        pkgs.javaPackages.compiler.temurin-bin.jre-8
        pkgs.javaPackages.compiler.temurin-bin.jre-17
        pkgs.javaPackages.compiler.temurin-bin.jre-21
        pkgs.javaPackages.compiler.temurin-bin.jre-25
      ];
    })

    mangohud_git
    protonup-rs
  ];
}
