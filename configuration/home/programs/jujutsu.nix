{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.packages = with pkgs; [
    jujutsu
    jjui
  ];

  programs.zed-editor = lib.mkIf (config.programs.zed-editor.enable) {
    userTasks = [
      {
        label = "jjui";
        command = "jjui";
        hide = "on_success";
        use_new_terminal = true;
        allow_concurrent_runs = false;
        shell = {
          program = "bash";
        };
      }
    ];
    userKeymaps = [
      {
        context = "jujutsu";
        bindings = {
          ctrl-u = "task::Spawn";
        };

        task_name = "jjui";
        reveal_target = "center";
      }
    ];
  };
}
