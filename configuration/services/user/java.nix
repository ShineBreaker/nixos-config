{ config, pkgs, ... }:
{
  programs.java = {
    enable = true;
    package = pkgs.graalvmPackages.graalvm-ce.override {
      # enableJavaFX = true;
    };
  };

  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

  environment.systemPackages = [
    pkgs.openjfx24
  ];

}
