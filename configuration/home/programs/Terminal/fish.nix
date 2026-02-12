{
  ...
}:

{
  programs = {
    atuin.enable = true;
    direnv.enable = true;
    eza.enable = true;
    fzf.enable = true;
    zoxide.enable = true;

    fish = {
      enable = true;
      shellAbbrs = {
        commit = "git commit --all";
        enter = "toolbox enter";
        push = "git push";

        update = "sudo ll-cli upgrade && sudo flatpak upgrade";
        shutdown = "systemctl poweroff";
        reboot = "systemctl reboot";

        ls = "eza";
        cd = "z";
      };

      interactiveShellInit = ''
        fastfetch
        set --global fish_greeting 日々私たちが過ごしている日常は、実は、奇跡の連続なのかもしれない。
      '';
    };
  };
}
