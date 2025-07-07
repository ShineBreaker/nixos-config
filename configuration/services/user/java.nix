{ config, pkgs, ... }:
{
  programs.java = {
    enable = true;
    package = pkgs.graalvmPackages.graalvm-ce;
  };

  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd _JAVA_AWT_WM_NONREPARENTING=1";

}
