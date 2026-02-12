{
  config,
  ...
}:

{
  fileSystems = {
    "/home/brokenshine/Desktop" = {
      device = "/data/Desktop";
      depends = [
        "/data"
        "/home"
      ];
      options = [ "bind" ];
    };

    "/home/brokenshine/Documents" = {
      device = "/data/Documents";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Downloads" = {
      device = "/data/Downloads";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Games" = {
      device = "/data/Games";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Games/steam" = {
      device = "/data/.local/share/steam";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Music" = {
      device = "/data/Music";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Pictures" = {
      device = "/data/Pictures";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Programs" = {
      device = "/data/Programs";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/Public" = {
      device = "/data/Public";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/.local/share/osu" = {
      device = "/data/.local/share/osu";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/.local/share/PrismLauncher" = {
      device = "/data/.local/share/PrismLauncher";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };

    "/home/brokenshine/.var/app" = {
      device = "/data/.var/app";
      depends = config.fileSystems."/home/brokenshine/Desktop".depends;
      options = config.fileSystems."/home/brokenshine/Desktop".options;
    };
  };
}
