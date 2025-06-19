{ config, pkgs, ... }:
{
  programs.java = {
    enable = true;
    package = pkgs.zulu.override {
      enableJavaFX = true;
    };
  };

  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

}
