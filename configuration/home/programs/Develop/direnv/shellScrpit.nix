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
      #!/usr/bin/env bash
      set -euo pipefail

      echo "正在初始化pixi环境......"
      pixi init

      echo "正在写入direnv配置"
      cat > ./.envrc <<'EOF'
      watch_file pixi.lock
      eval "$(pixi shell-hook)"
      EOF

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
