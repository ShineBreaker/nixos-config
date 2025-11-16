{
  pkgs,
  ...
}:

{
  programs.java = {
    enable = true;
    package = pkgs.javaPackages.compiler.temurin-bin.jre-21;
  };

  environment.variables._JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=lcd";
  environment.variables._JAVA_AWT_WM_NONREPARENTING = "1";

}
