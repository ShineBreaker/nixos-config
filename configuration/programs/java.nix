{ config, pkgs, ... }:
{
  programs.java = {
    enable = true;
    package = pkgs.zulu17;
  };

  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";

  environment.systemPackages = with pkgs; [ openjdk8 ];

}

