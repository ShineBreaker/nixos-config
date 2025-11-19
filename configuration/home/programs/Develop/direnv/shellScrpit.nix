{
  pkgs,
  ...
}:

let
  initdev = pkgs.writeShellApplication {
    name = "initdev";
    runtimeInputs = [
      pkgs.pixi
      pkgs.direnv
    ];
    text = ''
      #!/bin/sh
      echo "正在初始化pixi环境......"
      pixi init
      echo "正在写入direnv配置"
      echo -e "watch_file pixi.lock\neval '$(pixi shell-hook)'" > ./.envrc
      echo "正在加载direnv配置"
      direnv allow
      sleep 0.4
      echo "已完成"
    '';

    checkPhase = ''
      ${pkgs.shellcheck}/bin/shellcheck "$target"
      ${pkgs.bash}/bin/bash -n "$target"
    '';
  };

in

{
  home.packages = [ initdev ];
}
