{config, pkgs, lib, ...}:
 {
  environment.systemPackages = with pkgs; [
    nemo-with-extensions alacritty mate.engrampa
    pavucontrol gtklock
    waypaper
    xwayland-run cage
    fuzzel brightnessctl
  ];

  programs.xwayland.enable = true;
  programs.niri.enable = true;
  
  security = {
    soteria.enable = true;
    polkit = {
      enable = true;
      ## extraConfig = ''
      ##   /* Allow any local user to do anything (dangerous!). */
      ##   polkit.addRule(function(action, subject) {
      ##     if (subject.local) return "yes";
      ##   });
      ## '';
    };
    pam.services.gtklock.text = lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
  };

  services = {
    gnome.gnome-keyring.enable = true;
    xserver.desktopManager.runXdgAutostartIfNone = true;
    gvfs.enable = true;
    seatd.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = "*";
    };
    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "Alacritty.desktop"
        ];
      };
    };
    autostart.enable = true;
  };
  
}
