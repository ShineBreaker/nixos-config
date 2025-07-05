{
  config,
  pkgs,
  lib,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings = rec {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet -r --user-menu --cmd niri-session --time --time-format '%Y-%m-%d %l:%M:%S'";
        user = "brokenshine";
      };
    };
  };

  environment.systemPackages = [
    pkgs.greetd.tuigreet
  ];

}
