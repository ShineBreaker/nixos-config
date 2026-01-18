{
  ...
}:

{
  programs = {
    eza.enable = true;
    direnv.enable = true;
    zoxide.enable = true;
    fzf.enable = true;

    fish = {
      enable = true;
      shellAbbrs = {
        commit = "git commit --all";
        enter = "toolbox enter";
        push = "git push";
        rebuild = "nh os switch . --ask";
        rebuildb = "nh os boot . --ask";
        rebuildc = "nh os switch . && nh clean all && nh os switch .";

        upgrade = "nix flake update && git commit -a -m 'bump nixos version.' && nh os boot . --ask";
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
