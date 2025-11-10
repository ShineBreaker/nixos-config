{
  ...
}:

{
  xdg.configFile = {
    "fish/functions/fish_prompt.fish".source = ./dotfiles/fish_prompt.fish;
  };

  programs = {
    eza.enable = true;
    direnv.enable = true;
    zoxide.enable = true;
    fzf.enable = true;

    fish = {
      enable = true;
      shellAbbrs = {
        commit = "git commit --all";
        push = "git push";
        rebuild = "nh os switch . --ask";
        rebuildb = "nh os boot . --ask";
        rebuildc = "nh os switch . && nh clean all && nh os switch .";

        upgrade = "nix flake update && git commit -a -m 'upgrade flake.nix' && nh os boot . --ask";
        update = "sudo ll-cli upgrade && sudo flatpak upgrade";
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
    };
  };
}
