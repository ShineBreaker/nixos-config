{
  pkgs,
  ...
}:

{
  users.defaultUserShell = pkgs.fish;

  environment.systemPackages = with pkgs; [
    bat
    tealdeer
    du-dust
    fd
    tokei
    duf
  ];

  programs.fish = {
    enable = true;
    shellAbbrs = {
      commit = "git commit --all";
      push = "git push";
      rebuild = "nh os switch . --ask";
      rebuildb = "nh os boot . --ask";
      rebuildc = "nh os switch . && nh clean all && nh os switch .";
      
      update = "nix flake update && git commit -a -m 'update.' && nh os boot . --ask";
      shutdown = "systemctl poweroff";
      reboot = "systemctl reboot";

      cat = "bat";
      du = "dust";
      find = "fd";
      df = "duf";
      cd = "z";

      nvim = "hx";
      vim = "hx";
      vi = "hx";
      helix = "hx";
    };
    interactiveShellInit = ''
      fastfetch
      set --global fish_greeting 日々私たちが過ごしている日常は、実は、奇跡の連続なのかもしれない。
    '';
    vendor = {
      functions.enable = true;
      config.enable = true;
      completions.enable = true;
    };
  };
}
