{
  pkgs,
  ...
}:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet -r --user-menu --remember-session --time --time-format '%Y-%m-%d %l:%M:%S'";
        user = "brokenshine";
      };
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "brokenshine";
      };
    };
  };

}
