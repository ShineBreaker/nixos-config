{
  pkgs,
  ...
}:

{
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_18;
    settings.port = 5432;
  };
}
