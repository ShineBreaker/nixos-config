{
  lib,
  pkgs,
  ...
}:

{
  boot = {
    plymouth = {
      enable = true;
      tpm2-totp.enable = true;
    };

    /*
      initrd.systemd.services.boot-delay-initrd = {
        description = "Artificial delay in initrd for Plymouth";
        wantedBy = [ "initrd.target" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.coreutils}/bin/sleep 5";
        };
      };
    */

    initrd.verbose = false;

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader.timeout = lib.mkDefault 0;
  };

  /*
    systemd.services.boot-delay-startup = {
      description = "Artificial delay before Plymouth quit";
      wantedBy = [ "plymouth-start.service" ];
      before = [
        "plymouth-quit.service"
        "display-manager.service"
      ]; # 如果你使用控制台而非图形界面，可移除 display-manager.service
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.coreutils}/bin/sleep 5";
      };
    };
  */

  systemd.services.boot-delay-shutdown = {
    description = "Artificial delay before Plymouth quit";
    wantedBy = [ "multi-user.target" ];
    before = [
      "plymouth-quit.service"
      "display-manager.service"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.coreutils}/bin/sleep 3";
    };
  };

}
